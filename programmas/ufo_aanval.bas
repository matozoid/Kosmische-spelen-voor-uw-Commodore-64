   10 rem ** ufo aanval **
   20 sr=53248
   30 poke 2040,13
   40 for i=0 to 62
   50 : read x
   60 : poke 13*64+i,x
   70 next i
   80 poke sr+21,1:poke sr+23,1:poke sr+29,1
   90 poke sr+1,112:poke sr+39,7:du=peek(sr+31)
  100 m$=" {down}{left}{rvon} {rvof}"
  110 poke 646,1
  120 input "{clr}niveau (1-3)";le
  130 if le<1 or le>3 then 120
  140 print "{clr}";:pl=21
  150 po=po+1
  160 rem ** plaats ufo bepalen **
  170 sa=40*9+pl-40*int(4*rnd(0)+5-le)+3-6*rnd(0)
  180 get a$
  190 pl=pl+(a$="{left}" and pl>0)-(a$="{rght}" and pl<40)
  200 rem ** beweeg schip en ufo **
  210 p1%=pl*8
  220 p2%=p1%/255:p1%=p1%-p2%*255
  230 poke sr,p1%:poke sr+16,p2%
  240 a1=0:a2=sa
  250 if sa>255 then a1=255:a2=sa-255
  260 print "{home}";tab(a1);spc(a2);m$;
  270 if peek(sr+31) and 1<>0 then 310
  280 sa=sa+40:if sa<10*40+pl then 180
  290 print "{left} ";
  300 if sa>=10*40+pl then 150
  310 rem ** explosie **
  320 poke 54272,0:poke 54273,20
  330 poke 54277,127:poke 54278,250
  340 poke 54276,129
  350 for du=1 to 15
  360 : poke 54296,16-du
  370 : poke 53280,int(16*rnd(0))
  380 : poke 53281,int(16*rnd(0))
  398 : poke 36877,128+int(20*rnd(0))
  400 : for t=1 to 50: next t
  410 next du
  420 poke 54296,0
  430 poke 53280,14:poke 53281,6
  440 poke 54276,0
  450 print "{clr}u heeft ";po-1;"punten"
  460 rem sprite data
  470 data 0,0,0,0,0,0,0
  489 data 0,0,0,0,0,12,6
  490 data 0,24,3,0,56,3,128
  500 data 120,3,192,120,3,192,248
  510 data 3,224,252,7,224,252,7
  520 data 224,127,31,192,127,191,192
  530 data 63,255,128,31,255,0,15
  540 data 254,0,3,248,0,0,0
  550 data 0,0,0,0,0,0,0
