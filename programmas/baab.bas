   10 rem ** baab **
   20 dim b(4,4)
   30 rem ** initialisatie **
   40 for r=1 to 4
   50 : for c=1 to 4
   60 :   b(r,c)=int(2*rnd(0)-1)
   70 next c,r
   80 print "{clr}";
 1000 rem ** schermlayout **
 1010 print "{home}{down}{down}";tab(16);"1234"
 1020 for r=1 to 4
 1030 : print
 1040 : print tab(13);str$(r)+" ";
 1050 : for c=1 to 4
 1060 :   if b(r,c) then print "b";:goto 1080
 1070 :   print "a";
 1080 next c,r
 1100 rem ** zet invoeren **
 1110 print:print
 1120 print spc(14) "rij   =";
 1125 input r
 1130 if r<1 or r>4 then 1120
 1140 for c=1 to 4
 1150 : b(r,c)=not b(r,c)
 1160 next c
 1170 print spc(14) "kolom =";
 1175 input c
 1180 if c<1 or c>4 then 1170
 1190 b(r,c)=not b(r,c)
 1200 for r=1 to 4
 1210 : b(r,c)=not b(r,c)
 1220 next r
 1230 goto 1000
