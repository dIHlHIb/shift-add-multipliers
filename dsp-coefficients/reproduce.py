#!/usr/bin/env python3
"""Recompute the complete coefficient tables and all exclusions. Requires Python 3.10+ and C++17."""
import argparse,hashlib,json,os,shutil,subprocess,sys,tempfile,time
from pathlib import Path
HERE=Path(__file__).resolve().parent
P=sys.executable
def run(*argv,cwd):
    subprocess.run([str(x) for x in argv],cwd=cwd,check=True)
def rebuild(work,opt):
    for d in ('src','data','proof','width'):
        shutil.copytree(HERE/d,work/d,ignore=shutil.ignore_patterns('__pycache__','.lake','mapped'))
    (work/'build').mkdir();(work/'results').mkdir()
    for f in ('fir-hcub.jsonl','fft-hcub32.jsonl'):
        shutil.copyfile(HERE/'results'/f,work/'results'/f)
    for script in ('twiddle.py','certify.py'):shutil.copyfile(HERE/script,work/script)
    for n,f in [('batch_five','batch_five'),('independent_forward','independent_forward'),('six','six'),
                ('two_remaining','two_remaining'),('reverse_verify','reverse_verify')]:
        run(opt.cxx,'-O2','-std=c++17','src/'+f+'.cpp','-o','build/'+n,cwd=work)
    step=lambda n,*args:run(P,'-B','src/'+n+'.py',*args,cwd=work)
    step('small_oracle');step('run_batch',17,19,23,29,31);step('replay','build/independent_forward')
    run('build/six','data/pending.tsv','results/six.tsv',cwd=work)
    found={tuple(l.split()[:2]) for l in (work/'results/six.tsv').read_text().splitlines()}
    pending={tuple(l.split()) for l in (work/'data/pending.tsv').read_text().splitlines()}
    missing=pending-found;assert missing=={('19641','26229')}
    (work/'data/last.tsv').write_text(''.join(' '.join(k)+'\n' for k in sorted(missing)))
    run('build/six','data/last.tsv','results/last-six.tsv',1,'deep',cwd=work)
    step('census');step('proof_data')
    step('fir_shards','VINOD03_26B',23,4,8);step('fir_shards','YEUNG04_40',23,3,64)
    step('fir_shards','VINOD03_26B',23,5,24,'--limit',1)
    step('fir_independent','VINOD03_26B',23,4);step('fir_independent','YEUNG04_40',23,3)
    step('fir_census');step('all_cp_lower');step('cut_controls');step('audit_data');step('compare_cp')
    step('width_probes');step('width_audit');run(P,'-B','width/generate.py','--check',cwd=work)
    step('certify_bench');step('rewire');step('rewire_reverse');step('compare_jmcm')
    for name in ('census.json','cp-census.json','fresh-cp-lower.json','width-census.json','hcub-rewiring.json','rewiring-independent.json','cli-certificates.json','jmcm-comparison.json'):
        assert json.load(open(work/'results'/name))==json.load(open(HERE/'results'/name)),name
    for f in (HERE/'proof').glob('*.lean'):
        assert f.read_bytes()==(work/'proof'/f.name).read_bytes(),f.name
    if opt.lean:step('lean_replay',opt.lean)
    if opt.rtl:
        flags=['--base',opt.iverilog_base] if opt.iverilog_base else []
        step('rtl_test',*opt.rtl,*flags)
    if opt.mapping:
        run('build/six','data/panel.tsv','results/panel-variants.tsv',500,cwd=work)
        step('panel',*opt.mapping);step('bench_map',*opt.mapping);step('exchange',*opt.mapping)
        step('summary');step('interpret');step('export_panel')
        step('matched_panel',*opt.mapping)
        step('audit_controls')
        assert json.load(open(HERE/'results/matched-hardware.json'))==json.load(open(work/'results/matched-hardware.json'))
        for f in (HERE/'rtl').iterdir():
            assert f.read_bytes()==(work/'rtl'/f.name).read_bytes(),f.name
        if opt.rtl:
            step('rtl_test',*opt.rtl,*flags,'--exported')
            step('rtl_transfer',opt.rtl[0],*opt.mapping,*flags)
            assert json.load(open(HERE/'results/rtl-transfer.json'))==json.load(open(work/'results/rtl-transfer.json'))
        for folder in ('panel','matched-panel','fir-mapping','exchange'):
            expect=HERE/'results'/folder
            for f in expect.glob('*.json'):
                assert json.load(open(f))==json.load(open(work/'results'/folder/f.name)),f.name
    print('PASS: 2,044 Arm target sets and 83 CP inputs. Fresh circuit and lower-bound ledgers agree.')
def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--quick',action='store_true',help='check stored circuits, normalized inputs, Arm source and baseline trials offline')
    p.add_argument('--work',type=Path,help='retain all rerun outputs in this new directory')
    p.add_argument('--cxx',default=os.environ.get('CXX','c++'))
    p.add_argument('--lean',type=lambda s:Path(s).resolve(),help='also rebuild all proofs with this Lean 4.19.0 binary')
    p.add_argument('--mapping',nargs=2,type=lambda s:Path(s).resolve(),metavar=('ABC','LIBERTY'),help='also redo the two standard-cell flows')
    p.add_argument('--rtl',nargs=2,type=lambda s:Path(s).resolve(),metavar=('IVERILOG','VVP'))
    p.add_argument('--iverilog-base',type=lambda s:Path(s).resolve());a=p.parse_args()
    if a.quick:
        if a.lean or a.mapping or a.rtl or a.work:p.error('--quick checks stored data only; select other flags with a full run')
        run(P,'-B','src/audit_data.py',cwd=HERE)
        run(P,'-B','src/audit_controls.py',cwd=HERE)
        run(P,'-B','src/compare_cp.py','--check',cwd=HERE)
        return run(P,'-B','src/compare_jmcm.py','--check',cwd=HERE)
    if a.work:
        work=a.work.resolve();work.mkdir(parents=True,exist_ok=False);rebuild(work,a)
    else:
        with tempfile.TemporaryDirectory() as tmp:rebuild(Path(tmp),a)
if __name__=='__main__':main()
