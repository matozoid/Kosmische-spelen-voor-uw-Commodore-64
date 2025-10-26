   10 rem **van 5 naar 0**
   15 d$="{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}"
   20 m=0
   30 dim a%(2,2)
   40 goto 1000: rem hoofdprogramma
  100 rem **schermlayout**
  110 print "{clr}"
  120 print d$ " {CBM-A}C{CBM-R}C{CBM-R}C{CBM-S}"
  130 print d$ " B B B B  q w e"
  140 print d$ " {CBM-Q}{SHIFT-*}{SHIFT-+}C{SHIFT-+}C{CBM-W}"
  150 print d$ " B B B B  a s d"
  160 print d$ " {CBM-Q}C{SHIFT-+}C{SHIFT-+}C{CBM-W}"
  170 print d$ " B B B B  z x c"
  180 print d$ " {CBM-Z}C{CBM-E}C{CBM-E}C{CBM-X}"
  190 return
  200 rem **bord opzetten**
  210 for a=1 to 11
  220 : i=9*rnd(0)+1
  230 : gosub 300:rem zet uitvoeren
  240 : gosub 500:rem bord afdrukken
  250 next a
  260 return
  300 rem **zet uitvoeren**
  310 y=int((i-1)/3)
  320 x=i-1-3*y
  330 for z=0 to 2
  340 : a%(x,z)=a%(x,z)+1
  350 : a%(z,y)=a%(z,y)+1
  360 next z
  370 a%(x,y)=a%(x,y)-1
  380 wf=1
  390 for p=0 to 2
  400 : for q=0 to 2
  410 :   if a%(p,q)=6 then a%(p,q)=0
  420 :   wf=wf and (a%(p,q)=0)
  430 : next q: next p
  440 return
  500 rem **bord afdrukken**
  510 print "{home}" d$
  520 for q=0 to 2
  530 : print d$ "{down}{rght}";
  540 : for p=0 to 2
  550 :   print "{rght}";right$(str$(a%(p,q)),1);
  560 : next p
  570 : print
  580 next q
  590 return
  600 rem **invoer**
  610 get a$:if a$="" then 610
  620 for a=1 to 9
  630 : if a$=mid$("qweasdzxc",a,1) then i=a:a=9
  640 next a
  650 m=m+1
  660 return
 1000 rem **hoofdprogramma**
 1010 gosub 100: rem schermlayout
 1020 gosub 200: rem bord opzetten
 1030 gosub 600: rem invoer
 1040 gosub 300: rem zet uitvoeren
 1050 gosub 500: rem bord afdrukken
 1060 if wf=0 then 1030
 1070 print "{down}"
 1080 print spc(10) " gelukt! in";m;"zetten!"
