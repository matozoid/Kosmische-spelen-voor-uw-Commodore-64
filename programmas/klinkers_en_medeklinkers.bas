   10 rem ** klinkers en medeklinkers **
   20 print "{clr}";
   30 input "aantal spelers ";np
   40 if np<1 then 20
   50 dim po(np),c$(7),wo$(20)
   60 goto 1000
  100 rem ** karakters opgeven **
  110 le$=""
  120 print "{down}beurt van speler";pl
  130 print "k of m?"
  140 for du=1 to 7
  150 : get in$
  160 : if in$<>"k" and in$<>"m" then 150
  170 : if in$="k" then ch$="aeiou"
  180 : if in$="m" then ch$="bcdfghjklmnpqrstvwxyz"
  190 : c$=mid$(ch$,rnd(0)*len(ch$)+1,1)
  200 : le$=le$+c$
  210 : print c$;
  220 next du
  230 return
  300 rem ** woord invoeren **
  310 le=0
  320 print "{down}tijd in seconden:"
  330 for tm=45 to 0 step -1
  340 : print "{home}{down}{down}{down}{down}{down}{down}        ";:if tm<10 then print " ";
  345 : print tm
  350 : for de=1 to 48
  360 :   get in$
  370 :   if (in$<>chr$(20) or le=0) and (in$<"a" or in$>"z") then 410
  375 :   if le>6 and in$<>chr$(20) then 410
  380 :   print "{home}{down}{down}{down}{down}{down}{down}{down}{down}";tab(le+1);in$
  390 :   if in$=chr$(20) then le=le-1:goto 410
  400 le=le+1:wo$(le)=in$
  410 next de,tm
  420 return
  500 rem ** punten berekenen **
  510 for c=1 to 7
  520 : c$(c)=mid$(le$,c,1)
  530 next c
  540 for co=1 to le
  550 : for c=1 to 7
  569 :   if wo$(co)=c$(c) then c$(c)="":goto 580
  570 : next c:goto 600
  580 next co
  590 po(pl)=po(pl)+le
  600 print "{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}";
  610 for p=1 to np
  620 : print "speler";p;":";po(p);"punten"
  630 next p
  640 return
 1000 rem ** hoofdprogramma **
 1010 for pl=1 to np
 1020 : gosub 100:rem karakters kiezen
 1030 : print "{clr}maak een woord van{down}":print tab(6);le$
 1040 : gosub 300 rem woord invoeren
 1050 : gosub 500 rem punten berekenen
 1060 next pl
 1070 goto 1010
 1080 end
