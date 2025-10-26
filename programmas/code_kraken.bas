   10 rem ** code kraken **
   20 a$="10100101011101010110"
   30 dim t(3,19)
   40 goto 1000
  100 rem ** initialisatie **
  110 for k=0 to 19
  120 : t(0,k)=val(mid$(a$,k+1,1))
  130 : t(1,k)=t(0,k)
  140 : t(2,k)=t(0,k)
  150 next k
  160 gosub 400
  170 for k=0 to 19
  180 t(3,k)=t(0,k)+t(1,k)+t(2,k)
  190 next k
  200 gosub 400
  210 return
  300 rem ** rij verschuiven **
  310 for i=1 to s
  320 h=t(r,0)
  330 for k=0 to 18
  340 : t(r,k)=t(r,k+1)
  350 next k
  360 t(r,19)=h
  370 next i
  380 return
  400 rem **random verschuiven **
  410 for r=0 to 2
  420 : s=int(20*rnd(0))
  430 : gosub 300
  440 next r
  450 return
  500 rem ** schermlayout **
  510 print "{clr}"
  520 for r=0 to 2
  530 : print "         ";
  540 : for k=0 to 19
  550 :   print chr$(t(r,k)+48);
  560 : next k
  570 : print
  580 next r
  590 print "         --------------------"
  600 f=0
  610 print "         ";
  620 for k=0 to 19
  630 : d=abs(t(0,k)+t(1,k)+t(2,k)-t(3,k))
  640 : print chr$(d+48);
  650 : f=f or d
  660 next k
  670 print
  680 return
  800 rem **invoer **
  810 print
  820 print spc(9) "rij     ";
  825 input r
  830 print spc(9) "stappen ";
  835 input s
  840 r=r-1
  850 return
 1000 rem ** hoofdprogramma **
 1010 gosub 100: rem initialisatie
 1020 nt=0
 1030 gosub 500: rem schermlayout
 1040 if f=0 then 1090
 1050 gosub 800: rem invoer
 1060 gosub 300: rem verschuiven
 1070 nt=nt+1
 1080 goto 1030
 1090 print
 1100 print spc(10) "gevonden in";nt;"beurten"
