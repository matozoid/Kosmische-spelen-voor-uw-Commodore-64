   10 rem ***duindigt***
   20 d$="{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}"
   30 gosub 1400
  200 rem **hoofdprogramma**
  220 print"{clr}";
  230 gosub 700
  250 gosub 1200
  260 print""d$"{up}{up}{up}{up}             "
  270 gosub 2000
  280 goto 400
  330 print""d$"paard "wi" heeft gewonnen !!!!!!!"
  331 for h=1 to 3000:next h
  335 cr=cr+i(wi)*p(wi)
  336 restore
  337 for u=0 to 5:poke v+u,0:next u
  338 y1=60:y2=200:y3=140
  339 x1=0:x2=0:x3=0
  340 ifcr>0 then 230
  350 print"{clr}u bent geruineerd !{down}"
  360 print"hopelijk heefy u uw"
  370 print"les geleerd."
  380 end
  400 rem**een stap vooruit**
  405 t%=rnd(ti)*3+1
  410 a1=3:a2=3:a3=3
  415 if t%=1 then a1=5
  420 if t%=2 then a2=5
  425 if t%=3 then a3=5
  430 x1=x1+a1:x2=x2+a2:x3=x3+a3
  435 if x1>252 then x1=0:y1=60:c1=c1-1
  440 if x2>252 then x2=0:y2=100:c2=c2-1
  445 if x3>252 then x3=0:y3=140:c3=c3-1
  450 if x1>110 and x1<120 then y1=y1-02:u1=14:x1=x1-a1+2:poke v,x1:x1=x1+2
  455 if x2>110 and x2<120 then y2=y2-02:u2=14:x2=x2-a2+2:poke v+2,x2:x2=x2+2
  460 if x3>110 and x3<120 then y3=y3-02:u3=14:x3=x3-a3+2:poke v+4,x3:x3=x3+2
  465 if x1>160 and x1<170 then y1=y1+02:u1=14:x1=x1-a1+2:poke v,x1:x1=x1+2
  470 if x2>160 and x2<170 then y2=y2+02:u2=14:x2=x2-a2+2:poke v+2,x2:x2=x2+2
  475 if x3>160 and x3<170 then y3=y3+02:u3=14:x3=x3-a3+2:poke v+4,x3:x3=x3+2
  480 if x1>=120 and x1<=160 then u1=14:x1=x1-a1+2:poke v,x1:x1=x1+2
  485 if x2>=120 and x2<=160 then u2=14:x2=x2-a2+2:poke v+2,x2:x2=x2+2
  490 if x3>=120 and x3<=160 then u3=14:x3=x3-a3+2:poke v+4,x3:x3=x3+2
  500 if u1=14 then u1=13:goto 510
  505 u1=14
  510 if u2=14 then u2=13:goto 520
  515 u2=14
  520 if u3=14 then u3=13:goto 530
  525 u3=14
  530 poke 2040,u1:poke 2041,u2:poke 2042,u3
  540 poke v,x1:poke v+2,x2:poke v+4,x3
  550 poke v+1,y1:poke v+3,y2:poke v+5,y3
  570 if c1<0 then wi=1:goto 330
  580 if c2<0 then wi=2:goto 330
  590 if c3<0 then wi=3:goto 330
  600 goto 400
  700 rem***initialiseer paarden***
  720 wi=0
  730 for k=1 to 3
  740 : x(k)=20
  750 : c1=1:c2=1:c3=1
  760 : p(k)=(int(rnd(0)*5)+1)/5
  770 : v(k)=p(k)*dv+vn
  780 : t(k)=5*(k-1)+3
  800 next k
  900 rem***inzetten***
  910 pt=0
  920 for i=1 to 3
  930 : p(i)=(v(i)-vn)/dv
  940 : pt=pt+p(i)
  950 next i
  960 for k=1 to 3
  970 : p(k)=int(pr/p(k))
  980 next k
  990 print"{clr}"
 1000 print"{home}********************"
 1010 print" u kunt nu inzetten"
 1020 print"********************"
 1030 print
 1040 print"kansen van de paarden"
 1050 print
 1060 for i=1 to 3
 1070 : print"paard";i;": ";p(i);"tegen 1"
 1080 next i
 1090 print
 1100 print"u heeft : fl";cr;"{left}  "
 1110 for i=1 to 3
 1120 : print"hoeveel zet u in op "
 1125 : print"paard";i;
 1130 : input i(i)
 1140 : re=cr-i(i)
 1150 : if re<0 then print "u leeft op te grote voet":goto 1120
 1160 : cr=cr-i(i):print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}u heeft : fl";cr;"{left} "
 1170 next i
 1180 return
 1200 rem***schermlayout***
 1210 print"{clr}";
 1220 print"{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}"
 1230 print"{down}"
 1240 print"{down}"
 1245 print:print
 1250 print"DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD"
 1260 print "kans: ";p(1);tab(12);p(2);tab(18);p(3)
 1270 print "inzet ";i(1);tab(12);i(2);tab(18);i(3)
 1280 print left$(d$,t(1)-3);"DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD"
 1290 for k=1 to 3
 1325 : print left$(d$,t(k)+3);"                NM                     "
 1330 : print left$(d$,t(k)+4);"DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD"
 1340 next k
 1341 print"{home}"
 1342 for r=1 to 16:printtab(27);"{red}{rvon} {CBM-+}          {f3}{cyn}"
 1343 next r
 1344 printtab(27);"{grn}{rvon}   finish   {f3}{cyn}"
 1350 input "start????";a$
 1370 return
 1400 rem**initialisatie**
 1420 vn=2:dv=1:vu=2
 1430 y1=60:y2=100:y3=140
 1440 cr=100:u1=14:u2=14:u3=14
 1450 x1=0:x2=0:x3=0
 1460 return
 2000 for n=0 to 62:read q:poke 832+n,q:next n
 2005 for n=0 to 62:read q:poke 896+n,q:next n
 2010 data 0,0,0,0,0,0,0,0,0,0,0,24
 2020 data 0,0,52,0,0,126,0,0,246,3,255,224
 2030 data 7,255,192,15,255,128,31,255,128,38,1,128
 2040 data 76,0,192,24,0,96,48,0,48,0,0,0
 2050 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 2060 data 0,0,0,0,0,0,0,0,0,0,0,24
 2070 data 0,0,52,0,0,126,0,0,246,3,255,224
 2080 data 7,255,192,15,255,128,31,255,128,38,1,128
 2090 data 67,3,0,3,134,0,0,204,0
 2095 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
 2100 v=53248:poke v+21,7:for m=2040 to 2042:poke m,13:next m:poke v+33,0
 2105 poke v+23,7:poke v+29,7
 2140 poke v+40,13
 2150 return
