   10 rem ** snelletterweg **
   20 print "{clr}"
   30 v=53248: rem laagste sprite register
   40 poke v+21,0
   50 av=peek(v+30): rem collisionregister legen
   60 poke 2040,14
   70 poke v+39,1
   80 rem invoeren moeilijkheidsgraad
   90 print "moeilijkheidsgraad (1-5) ?"
  100 get l$
  110 if l$>"5" or l$<"1" goto 100
  120 l=val(l$):print "{clr}"
  130 rem definieer sprite 0
  140 for i=0 to 62:read q
  150 : poke 832+i,q:next i
  160 for i=0 to 62:poke 896+i,0:next i: rem sprite 0 legen
  170 poke 53281,6:poke 53280,6: rem kleur weg
  180 rem beeld opbouwen
  190 print "{clr}{lblu}     alfabetic highway"
  200 print "{down}         niveau:";l
  210 print "{down}{down}{down}  abcdefghijklmnopqrstuvwxyz"
  220 for i=1 to 14
  230 : print "{rvon}                              "
  240 next i
  250 print "{up}{up}{up}{up}{up}{up}{up}{up}{up}{up}{up}{up}{up}{up}{up}{rght}{rght}";
  260 rem opzetten sprites 1-7
  270 for i=1 to 7
  280 : poke 2040+i,13
  290 : poke v+2*i,240
  300 : poke v+2*i+1, 93+16*i
  310 : poke v+39+i,2*i-1
  320 next i
  330 poke v+42,2
  340 poke v+21,254
  350 for i=1 to 26: rem hoofdlus
  360 : poke 56334,peek(56334) and 254: rem letterzetten
  370 : poke 1,peek(1) and 251
  380 : for j=0 to 7
  390 :   poke 896+3*j,peek(53248+i*8+j)
  400 : next j
  410 : poke 1,peek(1) or 4
  420 : poke 56334,peek(56334) or 1
  430 : poke v,32+i*8
  440 : poke v+1,98
  450 : poke v+21,255
  460 : for av=1 to 250:next av
  470 : print " {left}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}";
  480 : rem speel lus
  490 : for k=1 to 7
  500 :   get a$
  510 :   if a$=chr$(145) and peek(v+1)>98 then poke v+1,peek(v+1)-2
  520 :   if a$=chr$(17) then poke v+1,peek(v+1)+2
  530 :   x=peek(v+2*k)-5*l*rnd(1)-10-i/2
  540 :   if x<0 then x=x+240
  550 :   poke v+2*k,x
  560 :   if peek(v+30) and 1 then print:print "pech, u bent geraakt!":goto 690
  570 :   if peek (v+1)=218 goto 600
  580 : next k
  590 : goto 490
  600 : for av=1 to 250:next av
  610 : rem letter afwerken
  620 : print chr$(64+i);"{up}{up}{up}{up}{up}{up}{up}{up}{up}{up}{up}{up}{up}{up}{up}";
  630 : poke v+21,254
  640 next i
  650 rem afwerking
  660 poke v+21,0:print "{clr}uitstekend, het is u gelukt!"
  670 for ay=1 to 2000:next av
  680 if l<5 then l=l+1:goto 190
  690 for av=1 to 1000:next av
  700 get av$:if av$<>"" goto 700
  710 print "nog een keer? (j/n) ";
  720 get a$
  730 if a$="" goto 720
  740 if a$="j" then run
  750 if a$<>"n" then 720
  760 poke v+21,0
  770 end
  780 data 0,0,0,0,15,254,0,15,254,0,15,254,0,127,254
  790 data 0,159,254,0,159,254,0,255,254,0,240,0,0,255,254
  800 data 0,124,124,0,56,56,0,0,0,0,0,0,0,0,0
  810 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
