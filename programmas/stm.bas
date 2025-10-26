   10 rem **stm**
   20 print "{clr}{home}wilt u spelen met"
   30 print "{down}1:letters?"
   40 print "{down}2:cyfers?"
   50 print "{down}3:alleen met 0 en 1?"
   60 print "{down}4:of wilt u ophouden?"
   70 get a$
   80 on val(a$) goto 100,110,120,620
   90 goto 70
  100 a=26:b=65:goto 200
  110 a=10:b=48:goto 200
  120 a= 2:b=48
  200 rem **string vormen**
  205 input"{down}klaar(return) ???";k$
  209 if k$=" " then 209
  210 c=1:tt=300
  220 t=ti:ta=t
  230 a$=""
  240 for d=i to c
  250 : b$=chr$(b+rnd(0)*a)
  260 : print b$;
  270 : a$=a$+b$
  280 : for e=1 to tt:next e
  290 : print "{left} ";
  300 next d
  310 print
  400 rem **antwoord**
  410 input "antwoord";an$
  420 if an$=a$ then 600
  430 print "{down}fout!"
  440 print "aantal pogingen:";c
  450 print "het was:";a$
  460 print "tijd:";str$(int((ta-t)/.6)/100);" seconden"
  500 print "nog een keer (j/n)?"
  510 get a$
  520 if a$="j" then 200
  530 if a$<>"n" then 510
  540 goto 10
  600 c=c+1:ta=ti
  610 goto 230
  620 end
