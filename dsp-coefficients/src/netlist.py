"""Write BLIF for exact scalar products and map the circuits with ABC."""
from fractions import Fraction
from pathlib import Path
import os, re, subprocess, sys
abc=None
lib=None
out=None

def check(ops,goals):
    seen={1}
    for t,u,i,v,j in ops:
        assert abs(u) in seen and abs(v) in seen
        assert F2(i)*u+F2(j)*v==t
        seen.add(t)
    assert set(goals)<=seen

def F2(n):return Fraction(2)**n

def graph_files(name,ops,raw,style,bits=16):
    # Only integer wires. The widest unnormalized intermediate here fits
    # well inside this 48-bit signed accumulator on every 16-bit input.
    W=48;lines=[];counter=0
    def lut(args,table):
        nonlocal counter
        counter+=1;node=f"w{counter}";lines.extend([".names "+" ".join([*args,node]),*table]);return node
    def plus(a,b,minus=False):
        carry="one" if minus else "z";result=[]
        for x,y in zip(a,b):
            if minus:y=lut([y],["0 1"])
            diff=lut([x,y],["01 1","10 1"]);result.append(lut([diff,carry],["01 1","10 1"]))
            carry=lut([x,y,carry],["11- 1","1-1 1","-11 1"])
        return result
    def shift(v,k):return (["z"]*k+v)[:W] if k>=0 else (v[-k:]+[v[-1]]*(-k))[:W]
    def signed_add(a,sa,b,sb):
        if sa>0 and sb>0:return plus(a,b)
        if sa>0:return plus(a,b,True)
        if sb>0:return plus(b,a,True)
        raise ValueError("two negative parent signs cannot produce a positive coefficient")
    goals=[abs(c)//(abs(c)&-abs(c)) for c in raw]
    def products(x):
        if ops is None:
            result=[]
            for t in goals:
                pieces=[shift(x,i) for i in range(t.bit_length()) if (t>>i)&1]
                v=pieces[0]
                for a in pieces[1:]:v=plus(v,a)
                result.append(v)
            return result
        seen={1:x}
        for t,u,i,v,j in ops:
            r=max(0,-i,-j)
            assert (abs(u)*2**(i+r)+abs(v)*2**(j+r))*2**(bits-1)<2**(W-1)
            val=signed_add(shift(seen[abs(u)],i+r),u,shift(seen[abs(v)],j+r),v)
            seen[t]=shift(val,-r)
        return [seen[t] for t in goals]
    lanes=1 if style=="products" else 2
    ins=[[f"x{n}_{i}" for i in range(bits)] for n in range(lanes)]
    prod=[products(v+[v[-1]]*(W-bits)) for v in ins]
    if style=="products":
        ys=[v[:bits+(t-1).bit_length()] for v,t in zip(prod[0],goals)]
    else:
        (c,s)=raw
        sh=[(abs(k)&-abs(k)).bit_length()-1 for k in raw]
        x,y=[[shift(v,i) for v,i in zip(pair,sh)] for pair in prod]
        # Inputs are two signed arbitrary Q15 words, and the two outputs are
        # the exact bits [31:16] of c*x+s*y and -s*x+c*y, as in CMSIS.
        def combine(a,sa,b,sb):
            if sa<0 and sb<0:return plus(["z"]*W,plus(a,b),True)
            return signed_add(a,sa,b,sb)
        assert sum(map(abs,raw))*2**(bits-1)<2**31
        ys=[combine(x[0],c,y[1],s)[16:32],combine(x[1],-s,y[0],c)[16:32]]
    outs=[[f"o{n}_{i}" for i in range(len(vec))] for n,vec in enumerate(ys)]
    header=[".model rot",".inputs "+" ".join(sum(ins,[])),".outputs "+" ".join(sum(outs,[])),".names z",".names one","1"]
    for v,ports in zip(ys,outs):
        for b,port in zip(v,ports):lines.extend([f".names {b} {port}","1 1"])
    f=out/(name+"_"+style+".blif");f.write_text("\n".join(header+lines+[".end",""]));return f

def run(cmd,f,timeout):
    import resource
    # The timeout counts CPU seconds consumed by ABC.
    def limit_cpu():
        resource.setrlimit(resource.RLIMIT_CPU,(timeout,timeout+2))
    env=dict(os.environ)
    if sys.platform=="darwin" and (Path(abc).parent/"libreadline.8.dylib").is_file():
        paths=[str(Path(abc).parent),env.get("DYLD_LIBRARY_PATH","")]
        env["DYLD_LIBRARY_PATH"]=os.pathsep.join(p for p in paths if p)
    p=subprocess.run([abc,"-c",cmd],env=env,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True,preexec_fn=limit_cpu)
    f.write_text(p.stdout)
    if p.returncode: raise RuntimeError(f"ABC exit {p.returncode}: {p.stdout[-1500:]}")
    return re.sub(r"\x1b\[[0-9;]*m","",p.stdout)
