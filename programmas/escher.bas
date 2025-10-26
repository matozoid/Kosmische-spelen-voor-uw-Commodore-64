   10 rem **escher**
   20 mk=20
   30 print "{clr}"
   40 dim sy(mk,3)
   50 for cc=0 to mk
   60 : for r1=0 to 3
   70 :   read sy(cc,r1)
   80 : next r1
   90 next cc
  100 input "grootte basisvierkant";s
  110 sx=int(39/s)+1
  115 sy=int(23/s)+1
  120 dim ds(sx,sy),bs(s,s),ri(s,s),sc(s*sx,s*sy)
  130 print "{clr}";
  140 for r=0 to s-1
  150 : print "rij";r+1;tab(7);
  160 : a$=""
  170 : input a$
  180 : a$=left$(a$+"           ",s)
  190 : for k=0 to s-1
  200 :   bs(r,k)=asc(mid$(a$,k+1,1))
  210 : next k
  220 next r
  230 print
  240 print "richting van vierkant (n,z,o,w)"
  250 print "elke rij"sx"richtingen"
  260 print
  270 for b=0 to sy-1
  280 : print "rij";b+1,tab(7);
  290 : input a$
  300 : a$=left$(a$+"                      ",sx)
  310 : for a=0 to sx-1
  320 :  in$=mid$(a$,a+1,1)
  330 :  ds(a,b)=-((in$="n")+2*(in$="o")+3*(in$="z")+4*(in$="w"))-1
  340 :  if ds(a,b)<0 then ds(a,b)=0
  350 : next a
  360 next b
  370 print
  380 print "[evaluatie]"
  390 for r=0 to s-1
  400 : for k=0 to s-1
  410 :   for r1=3 to 0 step -1
  420 :     for cc=mk to 0 step -1
  430 :       if bs(k,r)=sy(cc,r1) then c2=cc:r2=r1:cc=0:r1=0
  440 :     next cc
  450 :   next r1
  460 :   bs(k,r)=c2
  470 :   ri(k,r)=r2
  480 : next k
  490 next r
 1000 print "[escher samenstellen]"
 1010 for r=0 to s-1
 1020 : for k=0 to s-1
 1030 :   for b=0 to sy-1
 1040 :     for a=0 to sx-1
 1050 :       on ds(a,b)+1 goto 1060,1070,1080,1090
 1060 :       x=k:y=r:goto 1100
 1070 :       x=s-r-1:y=k:goto 1100
 1080 :       x=s-k-1:y=s-r-1:goto 1100
 1090 :       x=r:y=s-k-1
 1100 :       r1=(ds(a,b)+ri(r,k)) and 3
 1110 :       sc(x+a*s,y+b*s)=sy(bs(r,k),r1)
 1120 :     next a
 1130 :   next b
 1140 : next k
 1150 next r
 2000 rem *escher afbeelden*
 2010 print "{clr}";
 2020 for y=0 to 23
 2030 : for x=0 to 39
 2040 :   if sc(x,y)>255 then print "{rvon}";:goto 2060
 2050 :   print "{rvof}";
 2060 :   print chr$(sc(x,y) and 255);
 2070 : next x
 2080 next y
 2090 print "]";
 2100 goto 2100
 3000 data  32, 32, 32, 32:rem" "
 3010 data 165,163,167,164:rem"T"
 3020 data 212,197,217,210:rem"G"
 3030 data 199,196,200,198:rem"G"
 3040 data 194,195,221,192:rem"B"
 3050 data 180,183,170,175:rem"T"
 3060 data 181,184,182,185:rem"{CBM-H}"
 3070 data 161,418,417,162:rem"{CBM-J}"
 3080 data 205,206,205,206:rem"M"
 3090 data 203,202,213,201:rem"K"
 3100 data 189,173,176,174:rem"{CBM-X}"
 3110 data 207,208,186,204:rem"O"
 3120 data 177,171,178,179:rem"{CBM-E}"
 3130 data 169,223,425,479:rem"{SHIFT-POUND}"
 3140 data 190,188,172,187:rem"{CBM-V}"
 3150 data 209,209,209,209:rem"Q"
 3160 data 214,214,214,214:rem"V"
 3170 data 215,215,215,215:rem"W"
 3180 data 219,219,219,219:rem"{SHIFT-+}"
 3190 data 166,422,166,422:rem"{CBM-+}"
 3200 data 191,447,191,447:rem"{CBM-B}"
