   10 rem ** schatzoeken **
   15 poke 53281,6
   20 sc=1024
   30 d$="{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}"
   40 goto 1000
  100 rem ** schermlayout **
  110 print "{clr}";
  120 print "{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+} {CBM-+} "
  130 print "{CBM-+}   3{CBM-+}2{CBM-+}{CBM-+}     6{CBM-+}   {CBM-+} "
  140 print "{CBM-+}5{CBM-+} {CBM-+}{CBM-+}    {CBM-+}{CBM-+}4{CBM-+}{CBM-+}  {CBM-+}{CBM-+}{CBM-+} "
  150 print "{CBM-+}{CBM-+}{CBM-+}   {CBM-+} {CBM-+}  {CBM-+}{CBM-+}5{CBM-+} {CBM-+}{CBM-+}7{CBM-+} "
  160 print "{CBM-+}   {CBM-+}3{CBM-+} {CBM-+}{CBM-+}    {CBM-+}    {CBM-+} "
  170 print "{CBM-+} {CBM-+} {CBM-+}{CBM-+}   {CBM-+} {CBM-+} {CBM-+}{CBM-+} {CBM-+}{CBM-+}{CBM-+}{CBM-+} "
  180 print "{CBM-+} {CBM-+}  {CBM-+} {CBM-+} {CBM-+} {CBM-+}5{CBM-+}  {CBM-+} 9{CBM-+} "
  190 print "{CBM-+} {CBM-+}{CBM-+}   {CBM-+}3{CBM-+} {CBM-+}{CBM-+}{CBM-+} {CBM-+}{CBM-+} {CBM-+}{CBM-+} "
  200 print "{CBM-+}   {CBM-+}{CBM-+} {CBM-+}{CBM-+}{CBM-+} {CBM-+}4{CBM-+}  {CBM-+} 8{CBM-+} "
  210 print "{CBM-+}1{CBM-+} {CBM-+}3 {CBM-+}     {CBM-+}{CBM-+} {CBM-+} {CBM-+}{CBM-+} "
  220 print "{CBM-+}{CBM-+}{CBM-+} {CBM-+}{CBM-+}{CBM-+}1 {CBM-+}{CBM-+}{CBM-+}{CBM-+}3{CBM-+} {CBM-+}  {CBM-+} "
  230 print "{CBM-+}    1{CBM-+}{CBM-+} {CBM-+}    {CBM-+} {CBM-+}{CBM-+} {CBM-+} "
  240 print "{CBM-+} {CBM-+} {CBM-+}{CBM-+}3{CBM-+} {CBM-+} {CBM-+} {CBM-+}{CBM-+}    {CBM-+} "
  250 print "{CBM-+} {CBM-+}    {CBM-+}   {CBM-+}    {CBM-+}{CBM-+}7{CBM-+} "
  260 print "{CBM-+} {CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+}{CBM-+} "
  300 y=14:x=1
  310 pl=40*y+x
  320 poke sc+pl,0
  330 print d$;p2,nc;
  340 return
  400 rem ** speler beweegt **
  410 t1=400-int(30*nc*rnd(0))
  420 for du=1 to t1
  430 : get di$:if di$="" then 510
  440 : vx=(di$="k")-(di$=":")
  450 : vy=(di$="o")-(di$=".")
  460 : np=40*(y+vy)+(x+vx)
  470 : pk=peek(sc+np):if pk<>32 and (pk<49 or pk>57) then 510
  480 : poke sc+pl,32:x=x+vx:y=y+vy:pl=np
  490 : po=pk-48:if po<0 then 510
  500 : p1=p1+po:p2=p2+po:print d$;p2;
  510 : poke sc+pl,0:if pl=40 then du=t1
  520 next du:if pl>40*15 then 400
  530 return
  600 rem ** vogel valt aan **
  610 dt=15-3*nc
  615 for i=1 to 10:get di$:next i
  620 bu=40*y+20
  630 pr=peek(sc+bu)
  640 poke sc+bu,31
  650 for de=1 to dt:next de
  660 get di$
  670 if di$=" " or pk=0 then return
  680 poke sc+bu,pk
  690 bu=bu-1
  700 goto 630
 1000 rem ** hoofdprogramma **
 1010 gosub 100: rem schermlayout
 1020 gosub 400: rem speler beweegt
 1030 if pl<40 then nc=nc+1:p2=p2+nc*p1:p1=0:goto 1010
 1040 gosub 600: rem vogel valt aan
 1050 if pk<>0 then poke sc+bu,pk:p1=p1+1:goto 1020
