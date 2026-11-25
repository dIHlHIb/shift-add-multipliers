import GPrefix7
import GPrefix8
import GPrefix9
import GPrefix10
import GPrefix11
import GPrefix12
import GPrefix13
import GPrefix14
import GPrefix15
import GPrefix16
import GPrefix17
import GPrefix18
import GPrefix19
import GPrefix20
import GPrefix21
import GPrefix22
import GPrefix23
import GPrefix24
import GPrefix25
import GPrefix26
import GPrefix27
import GPrefix28
import GPrefix29
import GPrefix30
import GPrefix31
import GPrefix32
import GPrefix33
import GPrefix34
import GPrefix35
import GPrefix36
import GPrefix37
import GPrefix38
import GPrefix39
import GPrefix40
import GPrefix41
import GPrefix42
import GPrefix43
import GPrefix44
import GPrefix45
import GPrefix46
import GPrefix47
import GPrefix48
import GPrefix49
import GPrefix50
import GPrefix51
import GPrefix52
import GPrefix53
import GPrefix54
import GPrefix55
import GPrefix56
import GPrefix57
import GPrefix58
import GPrefix59
import GPrefix60
import GPrefix61
import GPrefix62
import GPrefix63
import GPrefix64
import GPrefix65
import GPrefix66
import GPrefix67
import GPrefix68
import GPrefix69
import GPrefix70
import GPrefix71
import GPrefix72
import GPrefix73
import GPrefix74
import GPrefix75
import GPrefix76
import GPrefix77
import GPrefix78
import GPrefix79
import GPrefix80
import GPrefix81
import GPrefix82
import GPrefix83
import GPrefix84
import GPrefix85
import GPrefix86
import GPrefix87
import GPrefix88
import GPrefix89
import GPrefix90
import GPrefix91
import GPrefix92
import GPrefix93
import GPrefix94
import GPrefix95
import GPrefix96
import GPrefix97
import GPrefix98
import GPrefix99
import GPrefix100
import GPrefix101
import GPrefix102
import GPrefix103
import GPrefix104
namespace MCMWidthFinal
def Span (lo n : Nat) := ∀ k, lo≤k → k<lo+n → MCMWidthAll.familyExact k
private theorem single {k} (h : MCMWidthAll.familyExact k) : Span k 1 := by
  intro t a b
  have e : t=k := by omega
  simpa only [e] using h
private theorem connect {k n m} (a : Span k n) (b : Span (k+n) m) : Span k (n+m) := by
  intro t lo hi;by_cases middle : t<k+n;exact a t lo middle;exact b t (by omega) (by omega)
private theorem cover8_2 : Span 8 2 := connect (single GPrefix8.exact_width) (single GPrefix9.exact_width)
private theorem cover7_3 : Span 7 3 := connect (single GPrefix7.exact_width) cover8_2
private theorem cover11_2 : Span 11 2 := connect (single GPrefix11.exact_width) (single GPrefix12.exact_width)
private theorem cover10_3 : Span 10 3 := connect (single GPrefix10.exact_width) cover11_2
private theorem cover7_6 : Span 7 6 := connect cover7_3 cover10_3
private theorem cover14_2 : Span 14 2 := connect (single GPrefix14.exact_width) (single GPrefix15.exact_width)
private theorem cover13_3 : Span 13 3 := connect (single GPrefix13.exact_width) cover14_2
private theorem cover17_2 : Span 17 2 := connect (single GPrefix17.exact_width) (single GPrefix18.exact_width)
private theorem cover16_3 : Span 16 3 := connect (single GPrefix16.exact_width) cover17_2
private theorem cover13_6 : Span 13 6 := connect cover13_3 cover16_3
private theorem cover7_12 : Span 7 12 := connect cover7_6 cover13_6
private theorem cover20_2 : Span 20 2 := connect (single GPrefix20.exact_width) (single GPrefix21.exact_width)
private theorem cover19_3 : Span 19 3 := connect (single GPrefix19.exact_width) cover20_2
private theorem cover23_2 : Span 23 2 := connect (single GPrefix23.exact_width) (single GPrefix24.exact_width)
private theorem cover22_3 : Span 22 3 := connect (single GPrefix22.exact_width) cover23_2
private theorem cover19_6 : Span 19 6 := connect cover19_3 cover22_3
private theorem cover26_2 : Span 26 2 := connect (single GPrefix26.exact_width) (single GPrefix27.exact_width)
private theorem cover25_3 : Span 25 3 := connect (single GPrefix25.exact_width) cover26_2
private theorem cover29_2 : Span 29 2 := connect (single GPrefix29.exact_width) (single GPrefix30.exact_width)
private theorem cover28_3 : Span 28 3 := connect (single GPrefix28.exact_width) cover29_2
private theorem cover25_6 : Span 25 6 := connect cover25_3 cover28_3
private theorem cover19_12 : Span 19 12 := connect cover19_6 cover25_6
private theorem cover7_24 : Span 7 24 := connect cover7_12 cover19_12
private theorem cover32_2 : Span 32 2 := connect (single GPrefix32.exact_width) (single GPrefix33.exact_width)
private theorem cover31_3 : Span 31 3 := connect (single GPrefix31.exact_width) cover32_2
private theorem cover35_2 : Span 35 2 := connect (single GPrefix35.exact_width) (single GPrefix36.exact_width)
private theorem cover34_3 : Span 34 3 := connect (single GPrefix34.exact_width) cover35_2
private theorem cover31_6 : Span 31 6 := connect cover31_3 cover34_3
private theorem cover38_2 : Span 38 2 := connect (single GPrefix38.exact_width) (single GPrefix39.exact_width)
private theorem cover37_3 : Span 37 3 := connect (single GPrefix37.exact_width) cover38_2
private theorem cover41_2 : Span 41 2 := connect (single GPrefix41.exact_width) (single GPrefix42.exact_width)
private theorem cover40_3 : Span 40 3 := connect (single GPrefix40.exact_width) cover41_2
private theorem cover37_6 : Span 37 6 := connect cover37_3 cover40_3
private theorem cover31_12 : Span 31 12 := connect cover31_6 cover37_6
private theorem cover44_2 : Span 44 2 := connect (single GPrefix44.exact_width) (single GPrefix45.exact_width)
private theorem cover43_3 : Span 43 3 := connect (single GPrefix43.exact_width) cover44_2
private theorem cover47_2 : Span 47 2 := connect (single GPrefix47.exact_width) (single GPrefix48.exact_width)
private theorem cover46_3 : Span 46 3 := connect (single GPrefix46.exact_width) cover47_2
private theorem cover43_6 : Span 43 6 := connect cover43_3 cover46_3
private theorem cover50_2 : Span 50 2 := connect (single GPrefix50.exact_width) (single GPrefix51.exact_width)
private theorem cover49_3 : Span 49 3 := connect (single GPrefix49.exact_width) cover50_2
private theorem cover52_2 : Span 52 2 := connect (single GPrefix52.exact_width) (single GPrefix53.exact_width)
private theorem cover54_2 : Span 54 2 := connect (single GPrefix54.exact_width) (single GPrefix55.exact_width)
private theorem cover52_4 : Span 52 4 := connect cover52_2 cover54_2
private theorem cover49_7 : Span 49 7 := connect cover49_3 cover52_4
private theorem cover43_13 : Span 43 13 := connect cover43_6 cover49_7
private theorem cover31_25 : Span 31 25 := connect cover31_12 cover43_13
private theorem cover7_49 : Span 7 49 := connect cover7_24 cover31_25
private theorem cover57_2 : Span 57 2 := connect (single GPrefix57.exact_width) (single GPrefix58.exact_width)
private theorem cover56_3 : Span 56 3 := connect (single GPrefix56.exact_width) cover57_2
private theorem cover60_2 : Span 60 2 := connect (single GPrefix60.exact_width) (single GPrefix61.exact_width)
private theorem cover59_3 : Span 59 3 := connect (single GPrefix59.exact_width) cover60_2
private theorem cover56_6 : Span 56 6 := connect cover56_3 cover59_3
private theorem cover63_2 : Span 63 2 := connect (single GPrefix63.exact_width) (single GPrefix64.exact_width)
private theorem cover62_3 : Span 62 3 := connect (single GPrefix62.exact_width) cover63_2
private theorem cover66_2 : Span 66 2 := connect (single GPrefix66.exact_width) (single GPrefix67.exact_width)
private theorem cover65_3 : Span 65 3 := connect (single GPrefix65.exact_width) cover66_2
private theorem cover62_6 : Span 62 6 := connect cover62_3 cover65_3
private theorem cover56_12 : Span 56 12 := connect cover56_6 cover62_6
private theorem cover69_2 : Span 69 2 := connect (single GPrefix69.exact_width) (single GPrefix70.exact_width)
private theorem cover68_3 : Span 68 3 := connect (single GPrefix68.exact_width) cover69_2
private theorem cover72_2 : Span 72 2 := connect (single GPrefix72.exact_width) (single GPrefix73.exact_width)
private theorem cover71_3 : Span 71 3 := connect (single GPrefix71.exact_width) cover72_2
private theorem cover68_6 : Span 68 6 := connect cover68_3 cover71_3
private theorem cover75_2 : Span 75 2 := connect (single GPrefix75.exact_width) (single GPrefix76.exact_width)
private theorem cover74_3 : Span 74 3 := connect (single GPrefix74.exact_width) cover75_2
private theorem cover78_2 : Span 78 2 := connect (single GPrefix78.exact_width) (single GPrefix79.exact_width)
private theorem cover77_3 : Span 77 3 := connect (single GPrefix77.exact_width) cover78_2
private theorem cover74_6 : Span 74 6 := connect cover74_3 cover77_3
private theorem cover68_12 : Span 68 12 := connect cover68_6 cover74_6
private theorem cover56_24 : Span 56 24 := connect cover56_12 cover68_12
private theorem cover81_2 : Span 81 2 := connect (single GPrefix81.exact_width) (single GPrefix82.exact_width)
private theorem cover80_3 : Span 80 3 := connect (single GPrefix80.exact_width) cover81_2
private theorem cover84_2 : Span 84 2 := connect (single GPrefix84.exact_width) (single GPrefix85.exact_width)
private theorem cover83_3 : Span 83 3 := connect (single GPrefix83.exact_width) cover84_2
private theorem cover80_6 : Span 80 6 := connect cover80_3 cover83_3
private theorem cover87_2 : Span 87 2 := connect (single GPrefix87.exact_width) (single GPrefix88.exact_width)
private theorem cover86_3 : Span 86 3 := connect (single GPrefix86.exact_width) cover87_2
private theorem cover90_2 : Span 90 2 := connect (single GPrefix90.exact_width) (single GPrefix91.exact_width)
private theorem cover89_3 : Span 89 3 := connect (single GPrefix89.exact_width) cover90_2
private theorem cover86_6 : Span 86 6 := connect cover86_3 cover89_3
private theorem cover80_12 : Span 80 12 := connect cover80_6 cover86_6
private theorem cover93_2 : Span 93 2 := connect (single GPrefix93.exact_width) (single GPrefix94.exact_width)
private theorem cover92_3 : Span 92 3 := connect (single GPrefix92.exact_width) cover93_2
private theorem cover96_2 : Span 96 2 := connect (single GPrefix96.exact_width) (single GPrefix97.exact_width)
private theorem cover95_3 : Span 95 3 := connect (single GPrefix95.exact_width) cover96_2
private theorem cover92_6 : Span 92 6 := connect cover92_3 cover95_3
private theorem cover99_2 : Span 99 2 := connect (single GPrefix99.exact_width) (single GPrefix100.exact_width)
private theorem cover98_3 : Span 98 3 := connect (single GPrefix98.exact_width) cover99_2
private theorem cover101_2 : Span 101 2 := connect (single GPrefix101.exact_width) (single GPrefix102.exact_width)
private theorem cover103_2 : Span 103 2 := connect (single GPrefix103.exact_width) (single GPrefix104.exact_width)
private theorem cover101_4 : Span 101 4 := connect cover101_2 cover103_2
private theorem cover98_7 : Span 98 7 := connect cover98_3 cover101_4
private theorem cover92_13 : Span 92 13 := connect cover92_6 cover98_7
private theorem cover80_25 : Span 80 25 := connect cover80_12 cover92_13
private theorem cover56_49 : Span 56 49 := connect cover56_24 cover80_25
private theorem cover7_98 : Span 7 98 := connect cover7_49 cover56_49
theorem all_widths (k : Nat) (hk : 7≤k) : MCMWidthAll.familyExact k := by
  by_cases large : 104<k
  · exact MCMWidthAll.all_large k large
  · exact cover7_98 k hk (by omega)
end MCMWidthFinal
#print axioms MCMWidthFinal.all_widths
