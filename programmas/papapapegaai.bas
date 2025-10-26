10 rem **papapapegaai**
20 print "{clear}{down}        " spc(10)"{rvrs on}{$d1}   "
30 print "       " spc(10)"{rvrs on}{shft pound}    "
40 print "       " spc(10)"{$dd}{rvrs on}    "
50 print "        " spc(10) "{rvrs on}    "
60 print "         " spc(10) "{rvrs on}  "
70 print "    {down}" spc(10) "{rvrs on}papapapegaai"
75 print
80 a=65:b=26
90 c=1
100 print "       ben je klaar papapapegaai?"
110 get a$:if a$="" then 110
120 print
130 t=ti
140 x$=chr$(a+b*rnd(1))
145 print x$;
150 get a$:if a$<>x$ then 150
160 if ti-t>600 then 180
170 c=c+1:goto 140
180 print
190 print "score:";c
200 print "tijd:";int((ti-t)/.6/100);"seconden"