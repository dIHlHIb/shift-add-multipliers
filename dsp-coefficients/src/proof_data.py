"""Generate explicit positive gate witnesses for the Lean kernel."""
import json
from pathlib import Path
def literal(t,a,b):
    for side,(x,y,z) in zip(('output','second','first'),((a,b,t),(a,t,b),(b,t,a))):
        for op,c in zip(('plus','minus','reverseMinus'),(x+y,x-y,y-x)):
            if c<=z or c%z:continue
            p=c//z
            if p&(p-1)==0:return f'⟨{t},{a},{b},.{side},.{op},{p.bit_length()-1}⟩'
    raise ValueError((t,a,b))
def main():
    data=json.load(open('results/census.json'))['cases'];names=[]
    for start in range(0,len(data),32):
        name='Q15Bank'+str(start//32).zfill(2);names.append(name)
        text=['import Q15Upper','namespace '+name,'open Q15Upper','def entries : List Entry := [']
        for row in data[start:start+32]:
            gates=[literal(t,abs(a),abs(b)) for t,a,i,b,j,r in row['gates']]
            text.append('  ⟨'+str(row['targets'])+', ['+','.join(gates)+']⟩')
        output='\n'.join(text[:4])+'\n'+',\n'.join(text[4:])+']\n'
        output+='set_option maxRecDepth 100000\nset_option maxHeartbeats 0\n'
        output+='theorem checked : entries.all accepts = true := by decide +kernel\n'
        output+='theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked\nend '+name+'\n'
        Path('proof',name+'.lean').write_text(output)
    text=''.join('import '+name+'\n' for name in names)+'namespace Q15Atlas\nopen Q15Upper\n'
    text+='def banks : List (List Entry) := ['+','.join(n+'.entries' for n in names)+']\n'
    text+='theorem each_checked : ∀ b ∈ banks, b.all accepts = true := by\n  intro b hb\n  simp only [banks,List.mem_cons,List.not_mem_nil,or_false] at hb\n'
    text+='  rcases hb with '+' | '.join('h' for _ in names)+'\n'
    for n in names:text+='  · simpa only [h] using '+n+'.checked\n'
    text+='theorem all_upper : ∀ b ∈ banks, ∀ e ∈ b, MCM.Fits MCM.unbounded e.targets e.gates.length := fun b hb => bank_sound b (each_checked b hb)\n'
    text+='theorem entry_count : (banks.map List.length).sum = '+str(len(data))+' := by decide +kernel\n#print axioms all_upper\n#print axioms entry_count\nend Q15Atlas\n'
    Path('proof/Q15Atlas.lean').write_text(text)
if __name__=='__main__':main()
