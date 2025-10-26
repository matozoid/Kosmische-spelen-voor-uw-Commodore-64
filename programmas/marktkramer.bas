   10 rem ** de marktkramer **
   20 dim jo$(9)
   30 for i=0 to 9
   40 : read jo$(i)
   50 next i
   60 print "{clr}{down}{rght}";
   70 nr=0:ti$="000000":mx=1
   80 goto 1000
   90 data grote nul,kleuter,krantejongen,klerk,autoverkoper,makelaar
  100 data marktkramer,oliemagnaat,millionair,schoolmeester
  200 rem ** random optelling **
  210 n1$=str$(int(1+(mx-1)*rnd(0)))
  220 n2$=str$(int(1+(mx-1)*rnd(0)))
  230 an=val(n1$)+val(n2$)
  240 print tab(nr+12-len(n1$));n1$
  250 print tab(nr+12-len(n2$));n2$;"+"
  255 print "{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}";
  260 for du=0 to nr+1
  270 : print "-";
  280 next du
  285 print
  290 return
  300 rem ** antwoord invoeren **
  310 input "antwoord ";an$
  320 return
  500 rem ** antwoord controleren **
  505 print:print
  510 if val(an$)=an then print "      goed !{down}":nr=hr+1:goto 540
  520 print "      fout !"
  525 print
  530 print "het is:";an
  535 print "uw tijd:";str$(int(ti/.6)/100);" sec"
  540 return
 1000 rem ** hoofdprogramma **
 1010 mx=mx*10
 1020 gosub 200: rem random optelling
 1030 gosub 300: rem antwoord invoeren
 1040 gosub 500: rem controleren
 1050 if val(an$)=an then 1010
 1060 print "beroep:";:print jo$(nr)
