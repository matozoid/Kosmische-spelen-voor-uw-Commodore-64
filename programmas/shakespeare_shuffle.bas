   10 rem **de shakespeare shuffle**
   15 poke 646,13
   20 d$="{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}"
   30 dim hx(8),hy(8),b$(8,8),t$(8)
   40 for k=1 to 8
   50 : read t$(k)
   60 next k
   70 data "to be or","not to b","e, that "
   80 data "is the q","uestion."
   90 data "william ","shakespe","are 1603"
  100 for x=1 to 8
  110 : for y=1 to 8
  120 :   b$(x,y)=mid$(t$(y),x,1)
  130 : next y:next x
  140 for k=1 to 8
  150 : read hx(k),hy(k)
  160 next k
  170 data -1,-2,1,-2,2,-1,2,1,1,2,-1,2,-2,1,-2,-1
  180 c1$="t":c2$="{rvon}t{rvof}"
  190 xo=1:yo=1:xn=1:yn=1
  200 goto 1000
  300 rem **karakter afdrukken**
  310 print left$(d$,y+1);tab(2*x);spc(9) b$(x,y);
  320 return
  400 rem **random springen**
  410 input "{clr}{down}aantal sprongen:";lv
  420 for du=1 to lv
  430 : nm=int(rnd(0)*8+1):gosub 500
  440 : if xo=xn and yo=yn then 430
  450 : xo=xn:yo=yn
  460 next du
  470 return
  500 rem **paarden sprong**
  510 xs=hx(nm):ys=hy(nm)
  520 if xo+xs<1 or xo+xs>8 or yo+ys<1 or yo+ys>8 then return
  530 xn=xo+xs:yn=yo+ys
  540 w$=b$(xn,yn)
  550 b$(xn,yn)=b$(xo,yo)
  560 b$(xo,yo)=w$
  570 if not di then return
  580 x=xo:y=yo:gosub 300
  590 x=xn:y=yn:gosub 300
  600 xo=xn:yo=yn
  610 return
  700 rem **schermlayout**
  710 print "{clr}"
  720 for x=1 to 8
  730 : for y=1 to 8
  740 :   gosub 300
  750 : next y
  760 next x
  770 print d$;tab(16);"1 2{down}"
  780 print tab(14);"8     3{down}"
  790 print tab(17);"h{down}"
  800 print tab(14);"7     4{down}"
  810 print tab(16);"6 5"
  820 return
  900 rem **sprong invoeren**
  910 for de=1 to 200:next de
  920 print left$(d$,yo+1);tab(2*xo);spc(9) c1$
  930 for de=1 to 200:next de
  940 print left$(d$,yo+1);tab(2*xo);spc(9) c2$
  950 get i$
  960 if i$>"" then return
  970 goto 910
 1000 rem **hoofdprogramma**
 1010 gosub 400:rem random springen
 1020 di=-1
 1030 gosub 700:rem schermlayout
 1040 gosub 900:rem sprong invoeren
 1050 nm=val(i$):if nm=0 or nm=9 then 1040
 1060 gosub 500:rem paardesprong
 1070 goto 1040
