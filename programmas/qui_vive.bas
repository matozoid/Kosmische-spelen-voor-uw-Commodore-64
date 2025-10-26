   10 rem ***qui vive***
   20 poke 646,13
   30 dim sf(41,4),so(41)
   40 dim d(107,1),df(15,8)
   60 dim cc(4,1),b(24),c(24)
   70 goto 3000
  100 rem **bereken punten van dubbele figuren (df)**
  110 gv=0:p1=0:p2=0:c1=0:c2=0
  120 d1=b(df(nf,0)):d2=b(df(nf,1))
  130 if d1=1 or d2=1 then p1=1
  140 if d1=10 or d2=10 then c1=10
  150 d1=b(df(nf,2)):d2=b(df(nf,3))
  160 if d1=1 or d2=1 then p2=1
  170 if d1=10 or d2=10 then c2=10
  180 gv=b(df(nf,4))+b(df(nf,5))+b(df(nf,6))
  190 p=gv+p1+p2+c1+c2
  200 if gv=30 and (c1=0 or c2=0) then p=p-10
  210 if gv=3 and (p1=0 or p2=0) then p=p-1
  220 return
  300 rem **initialisatie enkelvoudige figuren (sf)**
  310 for i=0 to 41:read x$
  320 for j=1 to 5
  330 :   sf(i,j-1)=asc(mid$(x$,j,1))-65
  340 next j,i:return
  350 rem vleugel (av><)
  360 data uqmsy,plhnt,kgcio
  370 data agmie,flrnj,kqwso
  380 data agmqu,bhnrv,ciosw
  390 data eimsy,dhlrx,cgkqw
  400 rem maal (x)
  410 data acgkm,bdhln,ceimo
  420 data flhpr,gimqs,hjnrt
  430 data kmquw,lnrvx,moswy
  440 rem plus (+)
  450 data bfghl,cghim,dhijn
  460 data gklmq,hlmnr,imnos
  470 data lpqrv,mqrsw,nrstx
  480 rem diagonaal (/)
  490 data agmsy,eimqu
  500 rem vertikaal (i)
  510 data afkpu,bglqv,chmrw
  520 data dinsx,ejoty
  530 rem horizontaal (-)
  540 data abcde,fghij,klmno
  550 data pqrst,uvwxy
  555 rem
  560 rem **initialisatie df's**
  570 for i=0 to 107 step 12:read x$
  580 for j=0 to 11:for k=0 to 1
  590 l=2*j+k+1:d(i+j,k)=asc(mid$(x$,l,1))-49
  600 next k,j,i
  610 return
  620 data "171:1a1c1e1m1o1p2>2@2b2j"
  630 data "393<3=3?3g474:4=4?4a4g4o"
  640 data "4p5@5b5d5j696<6c6e6m7=7a"
  650 data "7c7i7o7p8>8b8d8j9?9e9k:?"
  660 data ":a:e:k:o:p;>;@;d;j<=<c<i"
  670 data "=g=i=o>f>h>j?g?k?p@f@j@l"
  680 data "agaiakamaoapbhbjbncicmcp"
  690 data "djdldnekemeofrfwgsgwhthw"
  700 data "irixjsjxktkxlrlymsmyntny"
  790 rem
  800 rem **bereken velden vam df's**
  810 tc=4:tn=0
  820 for i=0 to 4:c(sf(d(df,0),i))=1:next i
  830 for i=0 to 4:sf=sf(d(df,1),i)
  840 : if c(sf)=1 then 860
  850 : df(nf,tn)=sf:tn=tn+1:goto 870
  860 : df(nf,tc)=sf:tc=tc+1:c(sf)=0
  870 next i
  880 for i=0 to 4:sf=sf(d(df,0),i)
  890 : if c(sf)=1 then df(nf,tn)=sf:tn=tn+1:c(sf)=0
  900 next i:return
 1000 rem **speelbord weergeven**
 1005 print spc(12)"{down}   abcde{down}"
 1010 for i=0 to 4:print spc(12)5-i;:for j=0 to 4
 1020 :   f=i*5+j
 1030 :   if b(f)=0 then print ".";
 1040 :   if b(f)=1 then print "W";
 1050 :   if b(f)=10 then print "Q";
 1060 : next j:print 5-i:next i
 1070 print spc(12)"{down}   abcde{down}"
 1080 return
 1100 rem **bepaal eigenaar van sf's**
 1110 om=-1:wm=-1
 1120 for sf=0 to 41
 1130 : p=b(sf(sf,0))+b(sf(sf,1))+b(sf(sf,2))+b(sf(sf,3))+b(sf(sf,4))
 1140 : if p=0 or p=10 or p=20 or p=30 then so(sf)=10:goto 1240
 1150 : if p<>40 then 1190
 1160 : gosub 1250
 1170 : gosub 1290
 1180 : wm=1:sf=41:goto 1240
 1190 : if p>20 or p<3 or p=11 or p=12 then so(sf)=0:goto 1240
 1200 : so(sf)=1
 1210 : if p=4 and om=-1 then gosub 1250
 1220 : if p=14 then gosub 1290
 1230 : if p=5 then sf=41
 1240 next sf:return
 1250 rem **bepaal verplichte zet (om)**
 1260 for i=0 to 4
 1270 : if b(sf(sf,i))=0 then om=sf(sf,i)
 1280 next i:return
 1290 rem **bepaal gepende steen**
 1300 for i=0 to 4
 1310 : if b(sf(sf,i))<>10 then 1350
 1320 : for j=0 to cc-1
 1330 :   if sf(sf,i)=cc(j,0) then cc(j,1)=1
 1340 : next j
 1350 next i
 1360 return
 1400 rem **bepaal eigenaar vam df's**
 1410 nc=0:np=0:nf=0
 1420 for i=0 to 15
 1430 : df(i,8)=-1
 1440 : df(i,7)=0
 1450 next i
 1460 for df=0 to 107
 1470 : o1=so(d(df,0)):o2=so(d(df,1))
 1480 : if o1<>o2 or o1=0 or o2=0 then 1600
 1490 : gosub 800
 1500 : gosub 100
 1510 : if p=4 or p=14 then df(nf,7)=1:goto 1540
 1520 : if o1=1 or p<=df(nf,8) then 1600
 1530 : df(nf,7)=10
 1540 : df(nf,8)=p
 1550 : nf=0
 1560 : for i=0 to 15
 1570 :   if df(i,8)>=df(hf,8) then 1590
 1580 :   if df(i,7)=0 or df(i,7)=10 then nf=1
 1590 : next i
 1600 next df
 1610 return
 1800 rem **bepaal strategische waarde van zet**
 1810 if wm=1 then 1960
 1820 mc=0:n2=0
 1830 for nf=0 to 15
 1840 : if df(nf,7)=0 then 1900
 1850 : gosub 100
 1860 : if df(nf,7)=1 then 1890
 1870 : if p=mc then n2=n2+1
 1880 : if p>mc then mc=p:n2=1
 1890 : if p=4 then nf=15
 1900 next nf
 1910 if pp=-1 then 1960
 1920 if p=4 then return
 1930 if mc<mp then return
 1940 if mc=mp and n2<n1 then return
 1950 if mc=mp and n2=n1 and rnd(0)<.5 then return
 1960 mp=mc:n1=n2
 1970 pp=cp:pt=ct
 1980 return
 2000 rem **beurt van de speler**
 2010 if pc<5 then 2050
 2020 print "welke steen wilt u verplaatsen";
 2030 gosub 2130: pt=x
 2040 if b(pt)<>1 then print"niet mogelijk":goto 2020
 2050 print"waar wilt u de steen neerzetten";
 2060 gosub 2130:pp=x
 2070 if b(pp)<>0 then print "niet mogelijk":goto 2050
 2080 if pc=5 then b(pt)=0
 2090 if pc<5 then pc=pc+1
 2100 b(pp)=1
 2110 gosub 1000
 2120 return
 2130 rem **invoer**
 2140 input x$:if len(x$)<>2 then 2190
 2150 l$=left$(x$,1):d$=right$(x$,1)
 2160 if l$<"a" or l$>"e" or d$<"1" or d$>"5" then 2190
 2170 x=asc(l$)-5*val(d$)-40
 2180 return
 2190 print "verkeerde invoer,";:goto 2140
 2200 rem **beurt van de computer**
 2210 if cc<5 then pt=cc:cc=cc+1:goto 2270
 2220 print spl(10)"ik neem "chr$(65+pt-int(pt/5)*5);5-int(pt/5)
 2230 b(pt)=0
 2240 for ci=0 to 4
 2250 : if cc(ci,0)=pt then pt=ci:ci=4
 2260 next ci
 2270 print spc(10)"ik zet hem op "chr$(65+pp-int(pp/5)*5);5-int(pp/5)
 2280 b(pp)=10:cc(pt,0)=pp
 2290 gosub 1000
 2300 return
 3000 rem **hoofdprogramma**
 3010 print spc(10)"even geduld a.u.b."
 3020 gosub 300
 3030 gosub 560
 3060 cc=0:pc=0
 3070 pp=12:goto 3300
 3080 for i=0 to 4:cc(i,1)=0:next i
 3090 gosub 1100
 3100 if p=5 then end
 3110 if wm=1 then 3130
 3120 gosub 1400
 3130 mp=0:n1=0:pp=-1
 3140 bf=0:ef=24
 3150 if om<>-1 then bf=om:ef=om
 3160 for cp=bf to ef
 3170 : if b(cp)<>0 then 3290
 3200 : b(cp)=10
 3210 : if cc<5 then gosub 1800:goto 3280
 3220 : for ci=0 to 4
 3230 :   if cc(ci,1) then 3270
 3240 :   ct=cc(ci,0):b(ct)=0
 3250 :   gosub 1800
 3260 :   b(ct)=10
 3270 : next ci
 3280 : b(cp)=0
 3290 next cp
 3300 gosub 2200
 3310 if wm=1 then end
 3320 gosub 2000
 3330 print spc(10) "even geduld a.u.b."
 3340 goto 3080
