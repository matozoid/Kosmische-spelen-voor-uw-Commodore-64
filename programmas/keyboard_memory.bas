   10 rem *** keyboard memory ***
   20 d$="{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}"
   30 r=int(rnd(0)*9+1)
   40 print"{clr}"
   50 dim t$(18),w$(18),q$(2),nn(2)
   60 a$="qwertyasdfghzxcvbn"
   70 b$="153997231546682847"
   80 goto 500
   90 rem**random scherm opbouwen**
  100 for n=1 to 18
  110 : t$(n)=mid$(a$,n,1)
  120 : di=n+r
  130 : if di<19 then 150
  140 : di=di-18
  150 : w$(n)=mid$(b$,di,1)
  160 next n
  170 return
  180 rem**initialisatie,schermlayout**
  190 for k=1 to 3
  200 : for j=1 to 6
  210 :   print"{home}"
  220 :   print right$(d$,3*k);tab(5*j);
  230 :   print t$((k-1)*6+j)
  235 : next j
  240 next k
  250 return
  260 rem**zet invoeren**
  270 print
  275 q$(2)=""
  280 for kk=1 to 2
  290 : get ky$
  300 : if ky$="" then 290
  305 : if ky$=q$(1) then 290
  310 : q$(kk)=ky$
  320 : tu=tu+1
  330 : rem**omdraaien kaart**
  335 : nn(kk)=0
  340 : for n=1 to 18
  350 :   k=int((n-.5)/6)+1
  360 :   j=n-(k-1)*6
  370 :   if t$(n)<>q$(kk) then 410
  380 :   print"{home}";right$(d$,3*k+1);tab(5*j);
  390 :   print w$(n);
  400 :   nn(kk)=n
  410 : next n
  415 : if nn(kk)=0 then 290
  420 next kk
  430 return
  440 rem**controleer kaarten**
  450 if w$(nn(1))<>w$(nn(2)) then return
  460 te=te+1
  470 t$(nn(1))=" "
  480 t$(nn(2))=" "
  490 return
  500 rem**hoofdprogramma**
  510 gosub 100:rem random scherm opbouwen
  520 gosub 190:rem scherm
  530 gosub 270:rem zet invoeren
  540 gosub 450:rem controleer kaarten
  550 if te<9 then 520
  560 print "{clr}{down}klaar in ";tu;"beurten"
  570 end
