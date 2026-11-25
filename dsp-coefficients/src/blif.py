"""Evaluate BLIF .names covers bit-parallel on an arbitrary finite input set."""
def evaluate(path, wires, mask):
    # ABC may split header declarations over multiple lines.
    rows=iter(path.read_text().replace("\\\n"," ").splitlines())
    lines=[s.strip() for s in rows if s.strip() and not s.lstrip().startswith("#")]
    i=0
    while i<len(lines):
        line=lines[i];i+=1
        if not line.startswith(".names "):
            assert not line.startswith((".gate",".subckt",".latch")),line
            continue
        *args,dest=line.split()[1:];col=0; polarity=None
        while i<len(lines) and not lines[i].startswith("."):
            row=lines[i].split();i+=1
            if not args:
                assert row in (["0"],["1"])
                col=mask if row==["1"] else 0
                continue
            pattern,bit=row
            assert bit in ("0","1") and len(pattern)==len(args) and polarity in (None,bit)
            polarity=bit;term=mask
            for c,arg in zip(pattern,args):
                if c=="1":term &= wires[arg]
                elif c=="0":term &= mask^wires[arg]
                else:assert c=="-"
            col|=term
        wires[dest]=mask^col if polarity=="0" else col
    return wires
