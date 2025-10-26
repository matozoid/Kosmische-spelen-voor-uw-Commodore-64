   10 rem**zombies in het moeras!**
   20 dim a(14,9)
   30 for c=0 to 14
   40 : a(c,0)=-1:a(c,9)=-1
   50 next c
   60 for c=0 to 9
   61 : a(0,c)=-1:a(14,c)=-1
   63 next c
   65 poke 53280,2
   70 a(1,0)=1:a(0,1)=1
   80 def fnr(x)=int(x*rnd(0)+1)
   90 em$="{rvof}   {down}{left}{left}{left}   {down}{left}{left}{left}   "
  110 pl$="{yel}{rvon}###{down}{left}{left}{left}###{down}{left}{left}{left}###"
  130 mo$="{wht}{rvon}***{down}{left}{left}{left}***{down}{left}{left}{left}***"
  150 dr$="{grn}{rvon}   {down}{left}{left}{left} {CTRL-F}{rvof}*{grn}{rvon} {down}{left}{left}{left}   "
  170 d$="{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}"
  180 goto 2000
  200 rem**print t$ op x,y**
  210 print left$(d$,3*(y-1)+1);tab(3*(x-1));t$
  220 return
  300 rem**initialisatie**
  310 print "{clr}";
  320 for li=1 to 24
  330 : print "{grn}{rvon}                                       ":rem 39 spaties
  340 next li
  350 m=0:px=13:py=8:a(13,8)=1
  360 x=px:y=py
  370 t$=pl$:gosub 200
  380 return
  400 rem**verplaatsen speler**
  410 rem invoer
  420 get in$:if in$="" then 420
  430 dx=(in$="{left}")-(in$="{rght}")
  440 dy=(in$="{up}")-(in$="{down}")
  470 if dx=0 and dy=0 then 420
  480 on a(px+dx,py+dy)+1 goto 500,550
  490 goto 420
  500 rem*gooi vlot*
  510 x=px+dx:y=py+dy
  520 t$=em$:gosub 200
  530 a(x,y)=1
  540 return
  550 rem**verplaatsen**
  560 x=px:y=py
  570 t$=em$:gosub 200
  580 px=px+dx:py=py+dy
  590 if px=0 or py=0 then 630
  600 x=px:y=py
  610 t$=pl$:gosub 200
  620 return
  630 rem*gewonnen*
  640 print d$;tab(10) "{wht}{rvof}gefeliciteerd !"
  650 for i=1 to 10:get s$:next i
  660 get s$:if s$="" then 660
  670 run
  700 rem**monster**
  710 mx=13:my=8
  715 x=mx:y=my
  720 t$=mo$:gosub 200
  730 on fnr(2) gosub 880,890
  740 lx=dx:ly=dy
  750 rem*nieuwe riching kiezen*
  760 if a(mx+lx,my+ly)<1 then 800
  770 if a(mx+ly,my-lx)=1 or a(mx-ly,my+lx)=1 then 840
  780 rem*zelfde riching*
  790 dx=lx:dy=ly
  795 goto 920
  800 rem*moeras in*
  810 on fnr(4) gosub 880,890,900,910
  820 if a(mx+dx,my+dy)=-1 then 810
  830 goto 920
  840 rem*mogelijke beurt*
  850 on fnr(4) gosub 880,890,900,910
  860 if dx=-lx and dy=-ly or a(mx+dx,my+dy)<1 then 780
  870 goto 920
  880 dx= 0:dy=-1:return
  890 dx=-1:dy= 0:return
  900 dx= 0:dy= 1:return
  910 dx= 1:dy= 0:return
  920 rem*verlaatsen*
  930 x=mx:y=my
  940 t$=em$:gosub 200
  950 mx=mx+dx
  960 my=my+dy
  970 lx=dx:ly=dy
  980 if a(mx,my)=0 then 1030
  990 x=mx:y=my
 1000 t$=mo$:gosub 200
 1010 if mx=px and my=py then 1080
 1020 goto 750
 1030 rem*monster verdronden*
 1040 a(mx,my)=-1
 1050 x=mx:y=my
 1060 t$=dr$:gosub 200
 1070 return
 1080 rem*speler gepakt*
 1090 print d$;tab(8) "{wht}{rvof}helaas, u bent gepakt!"
 1100 for i=1 to 10:get s$:next i
 1110 get s$:if s$="" then 1110
 1120 run
 2000 rem**hoofdprogramma**
 2010 gosub 300:rem initialisatie
 2020 gosub 400:rem verplaatsen speler
 2030 m=m+1
 2040 if fnr(px+py)>4 or m<5 then 2020
 2050 gosub 700:rem monster
 2060 goto 2020
