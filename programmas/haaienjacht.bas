   10 rem **haaienjacht**
   20 dim x$(2),y$(2),tu(3,8),co$(2)
   30 d$="{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}"
   35 sid=54272
   40 for i=0 to 23:poke sid+i,0:next i:poke sid+24,15:poke sid+5,15:poke sid+6,255
   50 b$="{rvon} {rvof}"
   60 ng=0:tr=0:mr=0
   70 for re=0 to 2
   80 : read x$(re),y$(re)
   90 next re
  100 data l,f,"","",r,b
  110 rem tune
  120 for tu=1 to 3
  130 : for no=1 to 8
  140 :   read tu(tu,no)
  150 next no,tu
  160 data 40,60,40,60,40,50,60,60
  170 data 30,35,40,45,50,55,60,60
  180 data 35,32,30,27,25,22,20,20
  190 co$(0)="jammer, u bent te ver weg"
  200 co$(1)="    gefeliciteerd!    "
  210 co$(2)="  uw brandstop is op  "
  230 goto 3000
  300 rem **geluid**
  310 poke sid+4,17:poke sid+1,tn
  320 for t=1 to tm
  330 : for dl=1 to 10:next dl
  340 next t
  360 return
 1000 rem **initialisatie**
 1010 ng=ng+1
 1020 sx=int(70*rnd(0))-35
 1030 sy=int(70*rnd(0))-35
 1040 di=abs(sx)+abs(sy)
 1050 md=di:sd=di
 1060 en=200:sh=0:hi=0:ns=0
 1070 vx=0:vy=0
 1080 return
 1100 rem **snelheid invoeren**
 1110 get k$
 1120 vx=4*((k$="{left}")-(k$="{rght}"))
 1130 vy=4*((k$="{up}")-(k$="{down}"))
 1140 sh=(k$=" ")
 1150 return
 1300 rem **afstand berekenen**
 1310 sx=sx-vx
 1320 sy=sy-vy
 1330 en=en+(vx<>0)+(vy<>0)-1
 1340 if en<=0 then en=0:goto 1460
 1350 rem haai zwemt weg
 1360 sx=sx+sgn(sx)
 1370 sy=sy+sgn(sy)
 1380 di=abs(sx)+abs(sy)
 1390 if di<md then md=di
 1400 if di>100 then 1460
 1410 if not sh then 1460
 1420 ns=ns+1
 1430 en=int(en-.5*di)
 1440 if en<=0 then en=0:goto 1460
 1450 hi=int(di*rnd(0))<=1
 1460 return
 1500 rem **uitvoer**
 1510 gosub 2000:rem wissen
 1520 print left$(d$,8);tab(sgn(vx)+19);x$(sgn(vx)+1);
 1530 print left$(d$,8+sgn(vy));tab(19);y$(sgn(vy)+1);
 1540 if sh then tm=2:tn=10:gosub 300:goto 1560
 1550 tm=1:tn=140-di:gosub 300
 1560 print "{home}{down}";tab(14);en;"{left} ";
 1570 return
 1600 rem **schermlayout**
 1620 print "{clr}{down}";spc(7);"brandstof:"en"ergs"
 1640 print left$(d$,15);spc(7);"bewegen: cursortoetsen"
 1650 print spc(7)"schieten: spatiebalk"
 1660 gosub 2000:rem wissen
 1670 print left$(d$,8); spc(7)"richting:"
 1680 print "{home}{down}{down}";spc(7)"<return> om te beginnen";
 1685 input an$:
 1710 return
 1800 rem **einde van het spel**
 1810 print "{home}{down}";spc(5);co$(ca-1)
 1820 for no=1 to 8
 1830 : tn=tu(ca,no):tm=10:gosub 300
 1840 next no
 1845 poke sid+4,0
 1850 print "{clr}{down}beginafstand:    ";sd;tab(20);"m"
 1860 print "aantal schoten:  ";ns
 1870 print "u naderde tot op:";md;tab(20);"m"
 1880 if hi then print "u raakte vanaf: ";di;tab(20);"m"
 1890 if hi then re=50+en/4+sd/10:goto 1900
 1895 re=50-di/2
 1900 re=int(re)
 1910 if re>100 then re=100
 1915 if re<0 then re=0
 1920 tr=tr+re
 1930 if re>mr then mr=re
 1940 print "{down}score  (0-100)"
 1945 print "{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}{SHIFT-*}"
 1950 print "aantal spelen:  ";ng
 1955 print "dit spel:       ";re
 1960 print "gemiddelse:     ";int(tr/ng)
 1970 print "maximum:        ";mr
 1980 return
 2000 rem **spaties**
 2010 print left$(d$,7);tab(18);"
 2020 print tab(18);"   "
 2030 print tab(18);"   "
 2040 return
 3000 rem **hoofdprogramma**
 3010 gosub 1000:rem initialisatie
 3020 gosub 1600:rem schermlayout
 3030 gosub 1100:rem invoer
 3040 gosub 1300:rem afstand berekenen
 3050 gosub 1500:rem uitvoer
 3060 ca=-3*(en=0)-2*hi-(di>100)
 3070 if ca=0 then 3030
 3080 gosub 1800:rem einde
 3090 print
 3095 for i=1 to 10:get k$:next i
 3100 input "{down}nog eens";an$
 3110 if left$(an$,1)="j" then 3010
 3120 end
