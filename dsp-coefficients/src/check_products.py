"""Exact truth table of each one-lane BLIF for all 65,536 signed inputs."""
from blif import evaluate
from functools import lru_cache

N = 1 << 16
MASK = (1 << N) - 1

@lru_cache(None)
def expected(coefficient, width):
    bitplanes = [bytearray(N // 8) for _ in range(width)]
    for raw in range(N):
        product = coefficient * (raw if raw < 32768 else raw - N)
        for j, plane in enumerate(bitplanes):
            plane[raw // 8] |= ((product >> j) & 1) << (raw % 8)
    return tuple(int.from_bytes(plane, "little") for plane in bitplanes)

def verify(file, goals):
    wires = {}
    for j in range(16):
        block = 1 << j
        wires[f"x0_{j}"] = MASK // ((1 << (2*block))-1) * (((1 << block)-1) << block)
    evaluate(file,wires,MASK)
    for i, coefficient in enumerate(goals):
        width = 16 + (coefficient - 1).bit_length()
        for j, plane in enumerate(expected(coefficient, width)):
            assert wires[f"o{i}_{j}"] == plane, (file, coefficient, j)
