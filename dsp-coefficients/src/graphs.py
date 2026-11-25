"""Check exact integer gate identities, allowing shifts and an exact division by two powers."""
from itertools import combinations_with_replacement


def odd_part(x):
    x = abs(x)
    return x // (x & -x) if x else 0


def instruction(a, b, t):
    for i, j in ((0,0), *((0,s) for s in range(1, max(a,b,t).bit_length()+2)),
                 *((s,0) for s in range(1, max(a,b,t).bit_length()+2))):
        for sign in (-1,1):
            raw = (a << i) + sign * (b << j)
            if odd_part(raw) == t:
                return [t, a if raw > 0 else -a, i, b*sign if raw > 0 else -b*sign, j, (abs(raw)&-abs(raw)).bit_length()-1]
    return None


def validate(targets, circuit):
    live = {1}
    for t,a,i,b,j,r in circuit:
        assert all(type(x) is int for x in (t,a,i,b,j,r))
        assert abs(a) in live and abs(b) in live and min(i,j,r)>=0
        assert t>1 and t%2 and t not in live and (a<<i)+(b<<j)==t<<r
        live.add(t)
    assert set(targets)<=live


def live_gates(targets,circuit):
    """Keep exactly the ancestors of the requested outputs, in their original order."""
    needed=set(targets)
    live=[]
    for row in reversed(circuit):
        t,a,_,b,_,_=row
        if t in needed:
            live.append(row)
            needed.update((abs(a),abs(b)))
    return live[::-1]


def recover(targets, labels):
    active=[1]; circuit=[]
    for t in labels:
        row=next((g for a,b in combinations_with_replacement(active,2) if (g:=instruction(a,b,t))),None)
        if row is None: raise ValueError((targets,t,active))
        circuit.append(row); active.append(t)
    validate(targets,circuit)
    return circuit
