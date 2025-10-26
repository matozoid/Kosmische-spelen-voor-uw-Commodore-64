   20 dim h(16,8)
   30 print "{clr}";
   40 rem ** maak balken met gaten **
   50 for x=0 to 16
   60 : for y=1 to 8
   70 :   h(x,y)=1
   80 next y,x
   90 rem ** 4 willekeurige gaten **
  100 for y=1 to 8
  110 : for b=1 to 4
  120 :   x=int(rnd(0)*16+1)
  130 :   h(x,y)=0
  140 next b,y
  150 rem ** plaats stenen **
  160 for b=1 to 8
  170 : h(2*b-1,0)=b+100
  180 next b
  190 gosub 610: rem schermlayout
  200 gosub 910: rem verschuiving berekenen
  210 gosub 610: rem schermlayout
  300 rem ** volgende stap invoeren **
  310 input z$
  320 y=val(left$(z$,1))
  330 if y<1 or y>8 then 510: rem wissen
  340 d$=mid$(z$,2,1)
  350 dx=val(mid$(z$,3))
  360 if dx=0 then 510:rem wissen
  370 if d$<>"l" and d$<>"r" then 510: rem wissen
  380 if d$="l" then gosub 1110: rem naar links schuiven
  390 if d$="r" then gosub 1210: rem naar rechts schuiven
  400 br=br+1
  410 gosub 910: rem verschuiving berekenen
  420 gosub 610: rem schermlayout
  430 if sc>=36 then end: rem alle stenen onderaan
  440 if dx>1 then dx=dx-1:goto 380:rem herhaal dx maal
  500 rem ** wissen **
  510 print "{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}"
  520 for y=10 to 21
  530 : print ""
  540 next y
  550 print "                     ";
  560 print "{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}"
  570 goto 310:rem volgende stap invoeren
  600 rem ** schermlayout **
  610 print "{home}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}";
  620 for y1=0 to 8
  630 : rem ** print nummer van de balk (of niet) **
  640 : if y1=0 then print "    "
  650 : if y1>0 then print spc(8) str$(y1);"> ";
  660 : for x=0 to 16
  670 :   z=h(x,y1)
  680 :   gosub 810:rem print element
  690 : next x
  700 : print
  710 next y1
  720 print spc(8) "    score";sc;" beurt";br
  730 return
  800 rem ** print element **
  810 if z=0 then print " ";
  820 if z=1 then print "{rvon}{CBM-@}{rvof}";
  830 if z>100 then print chr$(z-52);
  840 return
  900 rem ** verschuiving berekenen **
  910 for y1=8 to 0 step -1: rem zoek van onder naar boven
  920 : for x=0 to 16
  930 :   ty=y1
  940 :   if h(x,y1)<100 then 1020
  950 :   if ty>=8 then 1060: rem onderkant bereikt
  960 :   if h(x,ty+1)<>0 then 1020: rem geblokkeerd
  970 :   rem *** steen naar beneden ***
  980 :   h(x,ty+1)=h(x,ty)
  990 :   h(x,ty)=0
 1000 :   ty=ty+1
 1010 :   goto 950: rem blijven schuiven
 1020 : next x
 1030 next y1
 1040 return
 1050 rem ** onderkant bereikt **
 1060 sc=sc+h(x,ty)-100
 1070 h(x,ty)=0
 1080 goto 1020
 1100 rem ** schuif balk haar links **
 1110 tm=h(0,y)
 1120 for x=0 to 15
 1130 : h(x,y)=h(x+1,y)
 1140 next x
 1150 h(16,y)=tm
 1160 return
 1200 rem ** schuif balk naar rechts **
 1210 tm=h(16,y)
 1220 for x=16 to 1 step -1
 1230 : h(x,y)=h(x-1,y)
 1240 next x
 1250 h(0,y)=tm
 1260 return
