   10 rem ** blackbox **
   20 dim b(9,9,9)
   30 goto 1000
  100 rem ** schot invoeren **
  110 print "  schot invoeren"
  120 gosub 500:rem invoer
  130 dx=(px=8)-(px=1)
  140 dy=(py=8)-(py=1)
  150 dz=(pz=8)-(pz=1)
  160 if dx=0 and dy=0 and dz=0 then 120
  170 return
  200 rem ** resultaat berekenen **
  210 for tx=-1 to 1
  220 : for ty=-1 to 1
  230 :   for tz=-1 to 1
  240 :     if b(px+tx,py+ty,pz+tz) then 280
  250 :     dx=dx-tx
  260 :     dy=dy-ty
  270 :     dz=dz-tz
  280 next tz,ty,tx
  290 dx=sgn(dx):dy=sgn(dy):dz=sgn(dz)
  300 px=px+dx:py=py+dy:pz=pz+dz
  310 if (px=0)+(px=9)+(py=0)+(py=9)+(pz=0)+(pz=9) then 210
  320 print "  resultaat: ";px-dx;py-dy;pz-dz
  330 return
  400 rem ** gissing invoeren **
  410 print "  gissing invoeren"
  420 gosub 500: rem invoer
  430 if b(px,py,pz)=1 then print " goed!" : goto 450
  440 print "  fout!"
  450 return
  500 rem ** coordinaten invoeren **
  510 print "geef coordinaten:"
  520 input "p1=";px
  530 if px<1 or px>8 then 520
  540 input "p2=";py
  550 if py<1 or py>8 then 520
  560 input "p3=";pz
  570 if pz<1 or pz>8 then 520
  580 return
 1000 rem ** hoofdprogramma **
 1005 print "{clr}"
 1010 for at=1 to 5
 1020 : px=6*rnd(0)+2
 1021 : py=6*rnd(0)+2
 1022 : pz=6*rnd(0)+2
 1023 : if b(px,py,pz)=1 then 1020
 1025 : b(px,py,pz)=1
 1030 next at
 1040 gosub 100: rem schot invoeren
 1050 gosub 200: rem resultaat berekenen
 1060 print "  schieten of raden?(s/r)"
 1070 get in$
 1080 if in$="s" then 1040
 1090 if in$<>"r" then 1070
 1100 gosub 400:rem gissing invoeren
 1110 goto 1060
