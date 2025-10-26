   10 rem ** maanfase astrologie **
   20 goto 1000
  100 rem ** datum invoeren **
  110 print "{clr}maanfase{down}{down}"
  120 input "dag   dd ";dd
  130 input "maand mm ";m
  140 input "jaar jjjj";y
  150 if m<3 then m=m+12:y=y-1
  160 return
  200 rem ** berekening **
  210 t=int(365.25*y)+int(30.6*(m+1))+dd-694038
  220 t=t/36525
  230 la=350.737486+1236*t*360
  240 la=la+307*t+6*t/60
  250 la=la+51.18*t/3600-5.17*t*t/3600
  260 la=la-int(la/360)*360
  270 la=int(la+.5)
  280 return
  300 rem ** resultaten tonen **
  310 print "{down}{down}maanfase="la"graden{down}{down}"
  320 return
 1000 rem ** hoofdprogramma **
 1010 gosub 100 rem datum invoeren
 1020 gosub 200 rem berekening
 1030 gosub 300 rem resultaat berekenen
 1040 print "sla een toets aan"
 1050 get a$:if a$="" then 1050
 1060 goto 1010
