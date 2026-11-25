"""Read the signed integer coefficients present in the Arm source."""
import hashlib, re
from pathlib import Path
SIZES=(16,32,64,128,256,512,1024,2048,4096)
def normalize(raw):
    return tuple(sorted({abs(x)//(abs(x)&-abs(x)) for x in raw if x}-{1}))
def tables(source):
    text=Path(source).read_text()
    out={}
    for n in SIZES:
        block=re.search(r'\btwiddleCoef_'+str(n)+r'_q15\[\d+\][^=]*=\s*\{([^}]+)\}',text,re.I)
        vals=[int(h,16) for h in re.findall(r'0x([0-9a-f]+)',block[1],re.I)]
        assert len(vals)==3*n//2 and all(0<=x<65536 for x in vals)
        vals=[x-65536 if x>=32768 else x for x in vals]
        out[n]=list(zip(vals[::2],vals[1::2]))
    return out
