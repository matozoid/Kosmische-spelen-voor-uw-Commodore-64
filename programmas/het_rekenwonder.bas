   10 rem **het rekenwonder**
   20 t=0:x=0:r=0
   30 dim d(7)
   40 goto 160
   50 input "bewerking";f$
   60 for n=1 to len(f$)
   70 : e=asc(mid$(f$,n))
   80 : if e=42 or e=43 or e=45 or e=47 then 110
   90 next n
  100 goto 50
  110 a=val(mid$(f$,1,n-1))
  120 b=val(mid$(f$,n+1))
  130 t$=mid$(f$,n,1)
  140 if val(f$)<>int(val(f$)) then 50
  150 goto 310
  160 print "{clr}";
  170 for i=1 to 7
  180 : c=int(10*rnd(0)+1)
  190 : if int(4*rnd(0))=3 then c=int(4*rnd(0)+1)*25
  200 : d(i)=c
  210 next i
  220 f=int((9*rnd(0)+1)*100)
  230 print "{clr}{down}uw streefgetal is:";f
  240 print
  250 print "gebruik deze getallen"
  260 for i=1 to 7
  270 : print str$(d(i));
  280 next i
  290 print:print
  300 goto 50
  310 for i=1 to 7
  320 : if d(i)=a then 350
  330 next i
  340 goto 460
  350 d(i)=0
  360 for i=1 to 7
  370 : if d(i)=b then 400
  380 next i
  390 goto 460
  400 gosub 600
  405 print f$;"=";d(i)
  410 print "is het getal z0 goed";
  420 z$="":input z$
  430 if z$="" then 230
  440 if left$(z$,1)="j" then 490
  450 goto 230
  460 print "deze getallen heeft u niet. geen punten in deze ronde"
  470 x=0
  480 goto 510
  490 print "u heeft:";d(i);"op";f
  500 x=5-abs(f-d(i))
  510 if x<0 then x=0
  520 if x=5 then print "erg goed!"
  530 t=t+x
  540 r=r+1
  550 print "dit geeft ";x;"punten"
  560 print "u heeft nu";t;"punten, in";r;"ronden"
  570 input "nog eens";z$
  580 if left$(z$,1)="j" then 160
  590 end
  600 if t$="+" then d(i)=a+b:return
  610 if t$="-" then d(i)=a-b:return
  620 if t$="*" then d(i)=a*b
  630 if t$="/" then d(i)=a/b
  640 return
