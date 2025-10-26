   10 rem ** mini-mancala **
   20 dim b(3),su(3)
   30 def fnsp(x)=15+80*(x and 2)+6*(x and 1)
   40 for i=0 to 3
   50 : b(i)=2
   60 : read su(i)
   70 next i
   80 data 2,0,3,1
   90 e$="{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}"
  110 goto 1000
  200 rem ** schermlayout **
  210 print "{clr}{down}" spc(13) "mini-mancala"
  220 print
  230 print spc(11) " a"spc(13)"b"
  240 print spc(11) "  {CBM-A}CCCCC{CBM-R}CCCCC{CBM-S}"
  250 print spc(11) "  B     B     B"
  260 print spc(11) "  B  2  B  2  B"
  270 print spc(11) "  B     B     B"
  280 print spc(11) "  {CBM-Q}CCCCC{SHIFT-+}CCCCC{CBM-W}"
  290 print spc(11) "  B     B     B"
  300 print spc(11) "  B  2  B  2  B"
  310 print spc(11) "  B     B     B"
  320 print spc(11) "  {CBM-Z}CCCCC{CBM-E}CCCCC{CBM-X}"
  330 print spc(11) " c"spc(13)"d"
  340 return
  400 rem ** zet invoeren **
  410 print e$"     welk vak (c,d)                   "
  430 input s$
  440 if s$="" then 410
  450 s=-2*(s$="c")-3*(s$="d")
  460 if s=0 or b(s)=0 then 410
  470 return
  500 rem ** beurt computer **
  510 print e$"    nu is het mijn beurt              "
  520 for de=1 to 500:next de
  530 if le<3 and rnd(0)*le<.6 then s=int(rnd(0)*2):goto 560
  540 q=b(2)+10*(b(1)+10*b(0))
  550 s=1
  560 if q=143 or q=134 or q=611 or q=116 then s=0
  570 if b(s)=0 then s=1-s
  580 print e$"ik verdeel stenen van vak   "mid$("ab",s+1,1)
  600 return
  700 rem ** verdelen tegen de klok in **
  710 d=s
  720 for c=1 to b(s)
  730 : for de=1 to 400:next de
  740 : d=su(d)
  750 : if d=s then 740
  760 : b(s)=b(s)-1
  770 : print "{home}{down}{down}{down}{down}{down}{down}"spc(fnsp(s));b(s)
  780 : b(d)=b(d)+1
  790 : print "{home}{down}{down}{down}{down}{down}{down}"spc(fnsp(d));b(d)
  800 next c
  810 return
 1000 rem ** hoofdprogramma **
 1010 gosub 200: rem schermlayout
 1020 print e$"    niveau (1-3)";
 1030 input le
 1040 if le<1 or le>3 then 1020
 1050 print e$"   begint u (j/n) ";
 1060 input an$
 1070 if an$="n" then 1120
 1080 if an$<>"j" then 1050
 1090 gosub 400: rem zet invoeren
 1100 gosub 700: rem verdelen
 1110 if b(3)=8 then print e$"    u heeft gewonnen!                 ":goto 1160
 1120 gosub 500: rem beurt computer
 1130 gosub 700: rem verdelen
 1140 if b(0)=8 then print e$"     ik heb gewonnen!                 ":goto 1160
 1150 goto 1090
 1160 end
