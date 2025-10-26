   10 rem **explosie**
   15 poke 53280,0:poke 53281,0
   20 dim rb(5,5),sb(5,5),st(5,5)
   30 d$="{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}"
   40 goto 3000
  200 rem **copieer rb naar sb**
  210 for x=1 to si
  220 : for y=1 to si
  230 :   sb(x,y)=rb(x,y)
  240 : next y:next x
  250 return
  300 rem **copieer sb naar rb**
  310 for x=1 to si
  320 : for y=1 to si
  330 :   rb(x,y)=sb(x,y)
  340 : next y:next x
  350 return
  400 rem **initialisatie**
  410 print "{clr}welke bordgrootte kiest u (3 of 4)"
  420 input si
  430 if si<3 or si>4 then 410
  440 for x=1 to si
  450 : for y=1 to si
  460 :   st(x,y)=4+(x=1)+(x=si)+(y=1)+(y=si)
  470 : next y:next x
  490 print "wilt u beginnen (j/n)";
  500 input an$
  510 cm=(left$(an$,1)<>"j")
  600 rem **schermlayout**
  610 print "{clr}"
  620 print " M x"
  630 print "  M ";
  640 for x=1 to si:print x;" ";:next x:print
  650 for y=1 to si
  660 : if y=1 then print " y ";:goto 680
  670 : print "   ";
  680 : for x=1 to si:print "{SHIFT-+}{SHIFT-*}{SHIFT-*}{SHIFT-*}";:next x:print "{CBM-W}"
  690 : for i=1 to 3
  700 :   print " ";
  710 :   if i=2 then print str$(y);:goto 730
  720 :   print "  ";
  730 :   for x=1 to si:print "{SHIFT--}   ";:next x:print "{SHIFT--}"
  740 : next i:next y
  760 print "   ";
  770 : for x=1 to si:print "{CBM-E}{SHIFT-*}{SHIFT-*}{SHIFT-*}";:next x:print "{CBM-X}"
  780 return
  800 rem **speler zet**
  810 print d$;
  820 input "{lblu}uw zet (x,y)      {left}{left}{left}{left}{left}{left}";mx,my
  830 if mx<1 or mx>si or my<1 or my>si then 810
  840 if rb(mx,my)<0 then 810
  850 gosub 200
  860 x=mx:y=my:di=-1
  870 gosub 1000:rem explosie
  880 if et then 2200:rem einde
  890 gosub 300
  900 return
 1000 rem **explosie**
 1010 sb(x,y)=sb(x,y)+pl
 1020 ne=0
 1030 if di then x1=x:y1=y:gosub 1400
 1040 xp=0
 1050 for y=1 to si
 1060 : for x=1 to si
 1070 :   if abs(sb(x,y))<st(x,y) then 1160
 1080 :   xp=-1
 1090 :   ne=ne+1
 1100 :   sb(x,y)=sb(x,y)-st(x,y)*pl
 1110 :   if di then x1=x:y1=y:for i=1 to 999:next i:gosub 1400
 1120 :   x1=x:y1=y-1:gosub 1300
 1130 :   x1=x+1:y1=y:gosub 1300
 1140 :   x1=x:y1=y+1:gosub 1300
 1150 :   x1=x-1:y1=y:gosub 1300
 1160 next x,y
 1170 et=(ne>1.5*si*si)
 1180 if xp and not et then 1040
 1190 return
 1300 rem **optellen bij buren**
 1310 sb(x1,y1)=pl*(abs(sb(x1,y1))+1)
 1320 if di and st(x1,y1)>0 then gosub 1400
 1330 return
 1400 rem **druk veld af**
 1410 for i=1 to 500:next i
 1420 print left$(d$,4*y1+1);tab(4*x1);
 1430 print "   {down}{left}{left}{left}   {down}{left}{left}{left}   {up}{up}{left}{left}{left}";
 1440 if sb(x1,y1)=0 then 1480
 1450 if pl=-1 then print "{wht}{rvon}";
 1455 if pl=1  then print "{rvon}{grn}";
 1460 print "   {down}{left}{left}{left}";abs(sb(x1,y1));"{left} {down}{left}{left}{left}   ";
 1470 print "{rvof}";
 1480 return
 1600 rem **computer zet**
 1610 print d$;"{lblu}mijn zet:             "
 1620 be=1000
 1630 for tx=1 to si
 1640 : for ty=1 to si
 1650 :   if rb(tx,ty)>0 then 1720
 1660 :   gosub 200
 1670 :   x=tx:y=ty:di=0
 1680 :   gosub 1000:rem explosie
 1690 :   if et then mx=tx:my=ty:goto 1800
 1700 :   gosub 2000:rem evaluatie
 1710 :   if en<be or (en=be and rnd(0)<.4) then be=en:mx=tx:my=ty
 1720 : next ty:next tx
 1800 rem *uiteindelijke zet*
 1810 gosub 200
 1820 x=mx:y=my:di=-1
 1830 print d$;tab(8);x;",";y
 1840 gosub 1000:rem explosie
 1850 if et then 2200:rem einde
 1860 gosub 300
 1870 return
 2000 rem **evaluatie**
 2010 en=0
 2020 for x=1 to si
 2030 : for y=1 to si
 2040 :   en=en+sb(x,y)
 2050 :   if -sb(x,y)<st(x,y)-1 then 2110
 2060 :   en=en-2
 2070 :   if sb(x+1,y)=st(x+1,y)-1 then en=en+10
 2080 :   if sb(x,y+1)=st(x,y+1)-1 then en=en+10
 2090 :   if sb(x-1,y)=st(x-1,y)-1 then en=en+10
 2100 :   if sb(x,y-1)=st(x,y-1)-1 then en=en+10
 2110 : next y:next x
 2120 return
 2200 rem **einde**
 2210 print d$;"{lblu}{up}er ontstaat een oneinige reeks explosies.";
 2220 if pl=1 then print "u";:goto 2240
 2230 print "ik";
 2240 print " heb gewonnen in";nt;"{left} beurten"
 2250 input "nog eens";an$
 2260 if left$(an$,1)="j" then poke 646,14:clr:goto 10
 2270 poke 53280,254:poke 53281,246:end
 3000 rem **hoofdprogramma**
 3010 gosub 400:rem initialisatie
 3020 if cm then 3040
 3030 pl=1:gosub 800:rem player zet
 3040 pl=-1:gosub 1600:rem computer zet
 3050 nt=nt+1
 3060 goto 3030
