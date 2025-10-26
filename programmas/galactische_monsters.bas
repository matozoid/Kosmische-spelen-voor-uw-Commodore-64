   10 rem *** galactische monsters ***
   20 d$="{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}"
   30 s=54272
   35 for x=s to s+24:poke x,0:next x
   36 poke s+24,15
   37 poke s,0
   38 poke s+1,30
   39 poke s+5,15: poke s+6,250
   40 dim x(12)
   50 dim y(12)
   60 goto 2000
  100 rem**initialisatie en schermlayout**
  110 print"{clr}"
  120 for t=1 to 10
  130 : print spc(13) "{yel} QQQQQQQQQQQ"
  140 next t
  150 print spc(13) " {CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}"
  160 print"{grn}{home}{down}{down}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}+"
  170 x1=6
  180 y1=2
  190 for t=1 to 11
  200 : x(t)=t
  210 : y(t)=11
  220 next t
  230 ka=ka+.1
  240 return
  300 rem**verplaatsing speler**
  310 get ky$: if ky$="" then 470
  320 poke s+4,33
  340 for m=1 to 40:next m
  350 poke s+4,0
  370 print "{home}" tab(x1+13);left$(d$,y1);"{yel}Q"
  380 if ky$="d" then x1=x1+1
  390 if ky$="w" then y1=y1-1
  400 if ky$="x" then y1=y1+1
  410 if ky$="a" then x1=x1-1
  420 if x1<1 then x1=1
  430 if y1<1 then y1=1
  440 if x1>11 then x1=11
  450 print "{home}";tab(x1+13);left$(d$,y1);"{grn}+"
  460 print "{home}";tab(x1+13);left$(d$,y1);"{grn}+"
  470 for t=1 to 11
  480 : if x1<>x(t) then 520
  490 : if y1<>y(t) then 520
  500 : gosub 1020
  510 : ca=-1
  520 next t
  530 return
  600 rem**verplaatsing monsters**
  610 for t=1 to 11
  620 : print "{home}";tab(x(t)+13);left$(d$,y(t));"{yel}Q"
  630 : if rnd(0)<ka then 900
  640 : a=int(rnd(0)*4)
  650 : if a=0 then 690
  660 : if a=1 then 710
  670 : if a=2 then 730
  680 : goto 750
  690 : x(t)=x(t)+1
  700 : goto 760
  710 : x(t)=x(t)-1
  720 : goto 760
  730 : y(t)=y(t)-1
  740 : goto 760
  750 : y(t)=y(t)-1
  760 : if x(t)<1 then 810
  770 : if x(t)>11 then 830
  780 : if y(t)<1 then 850
  790 : if y(t)>11 then 870
  800 : goto 880
  810 : x(t)=x(t)+1
  820 : goto 960
  830 : x(t)=x(t)-1
  840 : goto 960
  850 : y(t)=y(t)+1
  860 : goto 960
  870 : y(t)=y(t)-1
  880 : print "{home}"; tab(x(t)+13);left$(d$,y(t));"{grn}{CBM-+}"
  890 : goto 960
  900 : x2=x1-x(t)
  910 : y2=y1-y(t)
  920 : if rnd(0)<.8 then 950
  930 : x(t)=x(t)+sgn(x2)
  940 : goto 960
  950 : y(t)=y(t)+sgn(y2)
  960 : print "{home}";tab(x(t)+13);left$(d$,y(t));"{yel}{CBM-+}"
  970 next t
  980 for u=1 to 11
  990 : print "{home}";tab(x(u)+13);left$(d$,y(u));"{yel}{CBM-+}"
 1000 next u
 1010 return
 1020 poke s+4,33
 1030 for l=1 to 10
 1040 : for m=10 to 30+l*2
 1050 :   poke s+1,m
 1060 : next m
 1070 next l
 1080 poke s+1,20
 1090 poke s+4,0
 1100 return
 2000 rem**hoofdprogramma**
 2010 ka=ka+.1
 2020 gosub 110:rem initialisatie en schermlayout
 2030 gosub 310:rem verplaatsing speler
 2040 br=br+1
 2050 if not ca then 2170
 2060 k=k+1:ca=0
 2070 sc=sc+at-br-5*k
 2080 at=at+20
 2090 br=0
 2100 if k<5 then 2020
 2110 print"{clr}einde vam het spel."
 2120 print"uw score: ";
 2130 print sc
 2160 end
 2170 if y1=11 then 2020
 2180 gosub 610
 2190 goto 2030
