   10 rem ** de wolf en de 5 kleine geitjes **
   20 dim b(10,10),r(5),c(5),nm(5)
   30 c$(0)="{CBM-+}{CBM-+}"
   40 c$(1)="  "
   50 d$="{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}"
   60 goto 2000
 1000 rem ** schermlayout **
 1010 on ca+2 goto 1020,1030,1040
 1020 r=rw:c=cw:tx$="ww":goto 1070
 1030 tx$=c$(r+c and 1):goto 1070
 1040 r=r(gt):c=c(gt)
 1050 tx$="g"+right$(str$(nm(gt)),1)
 1060 ca=gt
 1070 print left$(d$,3+r);tab(2*c-1);spc(7) tx$
 1080 b(r,c)=ca
 1090 return
 1100 rem ** initialisatie **
 1110 rem bord tekenen
 1120 print "{clr}";
 1130 for r=1 to 10
 1140 : for c=1 to 10
 1150 :   ca=0:gosub 1000
 1160 next c,r
 1170 rem wolf plaatsen
 1180 rw=1:cw=1:nm=int(rnd(0)*3+1)
 1190 ca=-1:gosub 1000
 1200 rem geiten plaatsen
 1210 for gt=1 to 5
 1220 : r(gt)=int(rnd(0)*10+1)
 1230 : c(gt)=int(rnd(0)*10+1)
 1240 : nm(gt)=int(rnd(0)*5+1)
 1250 : if b(r(gt),c(gt))<>0 then 1220
 1260 : ca=1:gosub 1000
 1270 next gt
 1280 return
 1300 rem ** beweging wolf **
 1310 print d$;"         u mag ";nm;"{left} zetten doen      "
 1320 for du=1 to nm
 1330 : get mv$:if mv$="" then 1330
 1350 : rd=(mv$="{up}" and rw>1)-(mv$="{down}" and rw<10)
 1360 : cd=(mv$="{left}" and cw>1)-(mv$="{rght}" and cw<10)
 1370 : te=b(rw+rd,cw+cd)
 1380 : if te<0 or te>0 and du<nm then 1330
 1390 : nm(te)=0
 1400 : sc=sc+sgn(te)
 1410 : r=rw:c=cw
 1420 : ca=0:gosub 1000
 1430 : rw=rw+rd:cw=cw+cd
 1440 : ca=-1:gosub 1000
 1450 next du
 1460 nm=int(rnd(0)*3+1)
 1470 return
 1500 rem ** computer zet **
 1510 print d$;"         nu is het mijn beurt       "
 1520 rem evaluatie
 1530 mx=-400
 1540 for gt=1 to 5
 1550 : if nm(gt)=0 then 1600
 1560 : cg=c(gt):rg=r(gt)+nm(gt):gosub 1800
 1570 : rg=r(gt)-nm(gt):gosub 1800
 1580 : rg=r(gt):cg=c(gt)+nm(gt):gosub 1800
 1590 : cg=c(gt)-nm(gt):gosub 1800
 1600 next gt
 1610 rem beweging geit
 1620 c=c(gb):r=r(gb)
 1636 ca=0:gosub 1000
 1648 r(gb)=rb:c(gb)=cb
 1650 nm(gb)=int(rnd(0)*5+1)
 1660 gt=gb
 1670 ca=1:gosub 1000
 1680 if mx<400 then return
 1690 print d$;"         u heeft verloren              "
 1760 end
 1800 rem ** status **
 1810 if abs(r(gt)-rw)+abs(c(gt)-cw)=nm then sq=200:goto 1820
 1815 sq=0
 1820 if rg<1 or rg>10 or cg<1 or cg>10 then return
 1830 if b(rg,cg)>0 then return
 1840 di=abs(rw-rg)+abs(cw-cg)
 1850 if di=0 then sq=500:goto 1930
 1860 if di=nm or di=nm-2 then return
 1870 if di<=5 then sq=sq+35
 1880 sq=sq-40*((rg=rw)+(cg=cw))
 1890 for g=1 to 5
 1900 : sq=sq-10*((rg<>r(g))+(cg<>c(g)))
 1910 next g
 1920 if sq+rnd(0)<mx then 1940
 1930 mx=sq:gb=gt:rb=rg:cb=cg
 1940 return
 2000 rem ** hoofdprogramma **
 2010 gosub 1100: rem initialisatie
 2020 gosub 1300: rem reweging wolf
 2030 if sc=3 then 2060
 2040 gosub 1500: rem computer zet
 2050 goto 2020
 2060 print d$:"         u heeft gewonnen!             "
 3070 end
