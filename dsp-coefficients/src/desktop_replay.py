"""Run the full arithmetic replay, adding installed Lean and hardware tools from a private user profile."""
import argparse
import json
import os
import sys
from pathlib import Path


def main():
    root=Path(__file__).resolve().parents[1]
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check',action='store_true',help='validate the configured tools and print the stages; skip the experiment')
    args=parser.parse_args()
    config=Path(os.environ.get('XDG_CONFIG_HOME',Path.home()/'.config'))/'mcm-dsp'/'tools.json'
    opts=json.loads(config.read_text()) if config.exists() else {}
    expected={'lean','iverilog','vvp','ivl_base','abc','liberty'}
    if not isinstance(opts,dict) or set(opts)-expected:parser.error('unrecognized field in tools.json')
    for key,value in opts.items():
        path=Path(value).expanduser()
        if not path.is_absolute() or not path.exists():parser.error(f'configured tool is unavailable: {key}')
        if key in ('lean','iverilog','vvp','abc') and not (path.is_file() and os.access(path,os.X_OK)):parser.error(f'tool is not executable: {key}')
        if key=='ivl_base' and not path.is_dir():parser.error('ivl_base must name a directory')
        if key=='liberty' and not path.is_file():parser.error('liberty must name a file')
        opts[key]=str(path)
    argv=[sys.executable,'-B',str(root/'reproduce.py')]
    stages=['integer witnesses and finite searches']
    if 'lean' in opts:argv+=['--lean',opts['lean']];stages+=['Lean 4.19.0']
    if set(opts)&{'iverilog','vvp','ivl_base'}:
        if not {'iverilog','vvp'}<=set(opts):parser.error('set both iverilog and vvp')
        argv+=['--rtl',opts['iverilog'],opts['vvp']];stages+=['signed RTL simulation']
        if 'ivl_base' in opts:argv+=['--iverilog-base',opts['ivl_base']]
    if set(opts)&{'abc','liberty'}:
        if not {'abc','liberty'}<=set(opts):parser.error('set both abc and liberty')
        argv+=['--mapping',opts['abc'],opts['liberty']];stages+=['two mapping flows and matched controls']
        if 'iverilog' in opts:stages+=['Verilog synthesis transfer']
    print('Enabled stages: '+', '.join(stages),flush=True)
    if args.check:return
    os.chdir(root)
    os.execv(sys.executable,argv)


if __name__=='__main__':main()
