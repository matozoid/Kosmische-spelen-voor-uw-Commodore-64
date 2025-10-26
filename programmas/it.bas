   10 rem ** i.t. **
   20 gosub 5000
   30 mv=8:nr=0:goto 50
   40 gosub 200
   50 gosub 500
   60 gosub 400
   70 if nw<6 then 40
  100 print "{down}gecondoleerd ! u bent overleden !"
  110 end
  200 rem ** invoer **
  210 nr=0:mv=0
  220 input "wat nu";c$
  230 for i=1 to 14
  240 : if left$(m$(i),len(c$))=c$ then mv=i:i=14
  250 next i
  260 if mv>6 then goto 310
  270 if mv=0 then print "ik begrijp u niet":goto 200
  280 nr=r(rm,mv):if nr<>0 then 310
  290 print "daar kunt u niet heen"
  300 goto 200
  310 print "{clr}";
  320 return
  400 rem ** uitvoer **
  410 print "u bent in de ";:print d$(rm)
  420 if rm<25 and(not lo or t(1)>0 and t(1)<>rm) then print "het is hier donker":goto 440
  430 for i=1 to 12
  432 : if t(i)=rm then print t$(i) " is hier"
  434 next i
  435 if lo and rl>120 then print "uw lamp is uitgegaan":lo=0
  436 if lo and rl>100 then print "de batterijen van uw lamp raken leeg"
  440 for i=1 to 6
  450 : if r(rm,i)<>0 then print "u kunt naar ";m$(i)
  460 next i
  470 print tab(8);"***"
  480 return
  500 rem ** handelingen **
  510 if nr<>0 then rm=nr
  520 th=0
  530 for i=1 to 12
  540 : if t(i)=rm then th=i:i=12
  550 next i
  560 hl=0
  570 for i=1 to 6
  580 : if h(i,1)=rm then hl=i:i=6
  590 next i
  600 rem * algemene handelingen *
  610 if rm<12 and rr<>8 then gosub 4200
  620 rl=rl-lo
  630 rem * speleres handelingen *
  640 if mv<7 then 660
  650 on mv-6 gosub 1000,1200,1300,1400,1600,1700,1800,1900
  660 rem * handlers *
  670 on hl gosub 2000,2300,2600,2700,2900,3100
  680 return
 1000 rem ** doden **
 1010 if hl=0 or hl>4 then print "u kunt hier alleen de tijd doden":return
 1020 tp=7:gosub 4100
 1030 if po=0 then print "met blote handen ?    dat is zelfmoord !" :return
 1040 print "u tracht de";:print h$(hl)" te doden"
 1050 print "u valt hem aan met uw zwaard,";
 1055 if (hl=1 or hl=2) and (h(hl,2)=6 or h(hl,2)=5) then 1070
 1060 if rnd(0)<.5 then print " maar hij  ontwijkt handig... ":goto 1090
 1070 print " en u geeft hem eeh enorme klap !"
 1080 h(hl,3)=h(hl,3)-1
 1090 if rnd(0)>.2 then 1120
 1100 print "dit is uw kans! u kunt toeslaan voordat hij zich herstelt."
 1110 input "wilt u dat (j/n)";an$:print "{clr}";
 1115 if an$="j" then print "u heft wederom uw     zwaard,";:goto 1055
 1120 if h(hl,3)>1 then return
 1130 if h(hl,3)=1 then print "uw slachtoffer is zwaar gewond":return
 1140 print "u heeft hem gedood"
 1150 h(hl,1)=0:t(hl+8)=rm:hl=0
 1160 return
 1200 rem ** help **
 1210 print "{clr}mogelijke commando's:{down}"
 1220 for i=1 to 14:print m$(i):next i
 1230 print "{down}sla een toets aan"
 1240 get in$:if in$="" then 1240
 1250 print "{clr}";
 1260 return
 1300 rem ** meenemen **
 1305 if (t(1)=0 or t(1)=rm) and lo or rm>24 then 1310
 1306 print "u ziet geen hand voor ogen, laat staan iets om mee te nemen!"
 1307 return
 1310 if th=0 then print "er is hier niets dat u mee kunt nemen":return
 1320 print "u pakt ";t$(th)
 1330 p(lp)=th:lp=lp+1:t(th)=0:th=0
 1340 return
 1400 rem ** neerleggen **
 1410 if lp=1 then print"u heeft niets !":return
 1420 print "wat wilt u neerleggen":input d$:print "{clr}";
 1430 tp=0:for i=1 to 12
 1440 : if d$=mid$(t$(i),4,len(d$)) then tp=i:i=12
 1445 : if d$=mid$(t$(i),5,len(d$)) then tp=i:i=12
 1450 next i
 1460 if tp=0 then print "ik begrijp u niet":return
 1470 gosub 4100
 1480 if po=0 then print "u heeft helemaal geen";:print t$(tp):goto 1520
 1490 print "u heeft ";t$(tp);:print " neergelegd"
 1500 th=p(po):t(th)=rm:lp=lp-1:p(po)=p(lp)
 1520 input "wilt u nog iets neerleggen";an$
 1530 print "{clr}";
 1540 if an$="j" then 1420
 1550 return
 1600 rem ** status **
 1610 if lp=1 then print "u bezit alleen kleren":goto 1640
 1620 print "u heeft:"
 1630 for i=1 to lp-1:print t$(p(i)):next i
 1640 print "u kunt nog";5-nw;"wonden overleven"
 1650 return
 1700 rem ** verband **
 1710 tp=6:gosub 4100
 1720 if po=0 then print "u kunt dat niet doen zonder verband":return
 1730 print "het ziet er niet best uit. ik heb alles nodig."
 1750 print "goed. dat zal wel even houden"
 1760 nw=0:lp=lp-1:p(po)=p(lp)
 1770 return
 1800 rem ** lantaarn aan/uit **
 1810 if t(1)>0 and t(1)<>rm then print "zonder lantaarn zeker!":return
 1820 if rl>120 then print "uw batterijen zijn leeg":return
 1830 lo=not lo
 1840 print "u doet de lantaarn ";
 1850 if lo then print "aan":return
 1860 print "uit"
 1870 return
 1900 rem ** lezen **
 1910 tp=4:gosub 4100
 1920 if po<>0 then 1930
 1925 print "wat wilt u lezen? u heeft niets!":return
 1930 if not lo and rm<25 then print "het is te donker om te lezen":return
 1940 t$="dq rszzs ddm jndjidrqdbdos hm chs andj":gosub 4000
 1950 t$="dq rszzs fdrbgqdudm: mddl ddm gdkkdgnmc dm vzs  gzri dm":gosub 4000
 1955 t$="fnnh gds hm cd azqadbtd.":gosub 4000
 1980 print "dat is alles"
 1990 return
 2000 rem ** i.t. **
 2010 if th=3 then h(1,2)=3:t(th)=0:th=0
 2020 on h(1,2) goto 2030,2060,2090,2190,2220
 2030 print tab(5);"** i.t. **"
 2034 print "de intra-terrestrial is hier. hij praat heel opgewonden, maar u ";
 2038 print "begrijpt hem     niet.":print
 2050 h(1,2)=2:return
 2060 t$="h.s. kzzs ldqjdm czs ghi dqfd cnqrs     gddes.":gosub 4000
 2070 t$="ghi jhijs udqsvhiedkc":gosub 4000
 2075 print
 2080 return
 2090 t$="h.s. cqhmjs zkrne ghi thsfdcqnnfc hr, mzddm onnrid adfhms":gosub 4000
 2105 t$="ghi vddq sd oqzsdm;":gosub 4000
 2110 t$="mt jtms t gdl vdk udqrszzm !":gosub 4000
 2120 t$="ghi ydfs: fz nmcdqfqnmcr dm yndj cd     mtkkhsx-anl.":gosub 4000
 2133 t$="ddm jqzmjyhmmhfd oqne vhk zkkd kdudm    dqldd udqmhdshfdm":gosub 4000
 2143 t$="   hj gda lds gds lnmrsdq fdunbgsdm czs":gosub 4000
 2150 t$="cd anl advzzjs, lzzq hj adm mt unkkdchf thsfdots":gosub 4000
 2160 t$="   ctr... mt lnds t oqnadqdm cd zzqcd sdqdccdm ":gosub 4000
 2170 print "dan zakt i.t. ineen."
 2180 h(1,2)=4:return
 2190 print "i.t. is blijkbaar in coma. nu moet u    alles alleen doen!"
 2205 print "  veel succes!"
 2210 h(1,2)=5:return
 2220 print "i.t. is hier.hij is in coma.":print
 2240 return
 2300 rem ** koekjes monster **
 2310 if th=8 then h(2,2)=5:t(th)=0:th=0
 2320 on h(2,2) goto 2330,2370,2400,2430,2470,2520
 2330 print "er is hier een enorm monster. het rolt met zijn ogen."
 2335 print "het brult: ben jij een koekie?"
 2360 h(2,2)=2:return
 2370 print "het monster brult steeds harder:{down}"
 2380 print "ben je een koekie ?!!"
 2390 h(2,2)=3:return
 2400 print "het blijft brullen en wordt agressief"
 2420 h(2,2)=4:return
 2430 print "het monster geeft u een verschrikkelijke klap. uw hoofd tolt"
 2450 nw=nw+1
 2460 h(2,2)=fnrd(3)+1:return
 2470 print "het monster zegt verrast: koekies ?!"
 2480 print "het begint meteen te eten. een enorme"
 2495 print "   ! ! b o n g ! !"
 2497 print "en het valt in slaap."
 2500 r(16,6)=1
 2510 h(2,2)=6:return
 2520 print "het monster slaapt"
 2530 return
 2600 rem ** slang **
 2610 print "er is hier een glibberige slang."
 2620 if rnd(0)<.4 then return
 2630 if lp=1 or rnd(0)<.5 then 2670
 2640 rn=fnrd(lp-1):t(p(rn))=12+fnrd(12):lp=lp-1:p(rn)=p(lp)
 2650 print "slinks jat hij iets."
 2670 print "hij glipt weg"
 2680 h(3,1)=h(3,1)+3:if h(3,1)>24 then h(3,1)=h(3,1)-8
 2690 return
 2700 rem ** hellehond **
 2710 on h(4,2) goto 2720,2750,2780
 2720 print "er is hier een reusachtige hellehond"
 2730 print "het lijkt erop dat hij u wil opeten"
 2740 h(4,2)=2:return
 2750 print "de hellehond valt aan en bijt u hard"
 2760 nw=nw+1
 2770 h(4,2)=3:return
 2780 print "de hellehond gromt en staat klaar voor een nieuwe aanval."
 2800 h(4,2)=1+fnrd(2):return
 2900 rem ** bom **
 2910 print "de nullity-bom is hier.er zijh drie dra-";
 2920 print "den die de bom met de tijdklok verbinden";
 2925 print "een bruine (b), ";
 2927 print "een gele  (g), ";
 2929 print "en een rode   (r)";
 2930 print "u moet er twee losmaken om de bom te"
 2939 print "stoppen."
 2940 input "welke als eerste";x$
 2950 input "welke als tweede";y$
 2960 cb=0:c$="bgr":for i=1 to 3
 2970 : cb=cb-(x$=mid$(c$,i,1))-(y$=mid$(c$,i,1))
 2980 next i
 2990 if cb<2 then print "{clr}pas op !":print "verkeerde letters !":goto 2910
 3000 if asc(x$)*asc(y$)=5412 then 3030
 3005 for i=1 to 10:poke 53281,1
 3010 : print "{clr} * enorme explosie *{down}"
 3012 : print "   ! rotsblokken !{down}"
 3014 : print "   ! stofwolken  !{down}"
 3016 : print "u bent moedig geweest maar helaas,"
 3020 : print "u bent niet geslaagd..."
 3022 : for j=1 to 4:poke 53281,9:next j,i
 3025 end
 3030 print "{clr}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}*** gefeliciteerd ***"
 3040 print "{down}u bent geslaagd waar anderen faalden!"
 3060 end
 3100 rem ** barbecue **
 3130 if t(2)=rm and t(12)=rm then th=8:t(th)=rm:t(2)=0:t(12)=0:h(6,2)=2
 3140 on h(6,2) goto 3150,3180,3220
 3150 print "er is hier een grote barbecue met een"
 3165 print "fel vuur eronder."
 3170 return
 3180 print "een enorme flits verlicht de omgeving"
 3187 print "een doordringende stank verspreidt zich"
 3210 h(6,2)=3:return
 3220 print "alles is nu rustig; zelfs de vieze stank"
 3240 print "is weg."
 3250 h(6,2)=1:return
 4000 rem ** decodeer text **
 4010 tn$="":for i1=1 to len(t$):c$=mid$(t$,i1,1)
 4020 : if c$="z" then c$="a":goto 4030
 4025 : if c$>="a" and c$<"z" then c$=chr$(asc(c$)+1)
 4030 : tn$=tn$+c$
 4040 next i1:if not in then print tn$
 4050 return
 4100 rem ** bezittingen **
 4110 po=0:for i=1 to lp-1
 4128 : if p(i)=tp then po=i:i=lp-1
 4138 next i
 4146 return
 4200 rem ** puzzel **
 4210 rt=rt+1
 4220 if rm=s(rt) then rr=rr+1
 4230 if rt<8 then return
 4240 if rr=8 then 4310
 4250 print "het is stikdonker en het lijkt alsof"
 4265 print "iets u optilt. even bent u buiten "
 4270 print "bewustzijn."
 4290 rt=1:rr=1:rm=1
 4300 return
 4310 print "   u hoort een vreemd geluid alsof er"
 4330 print "iets verschoven wordt."
 4340 for dl=1 to 3000:next dl
 4350 print "alles is weer stil."
 4360 r(2,1)=3
 4370 return
 5000 rem ** initialisatie **
 5010 print "{clr}{down}"spc(10) "even geduld a.u.b."
 5020 dim r(36,6),d$(36),m$(14),h(6,3),h$(6),t(12),t$(12),p(12),d(8)
 5030 def fnrd(x)=int(x*rnd(0)+1)
 5100 rem * verbindingen *
 5110 for i=1 to 36
 5120 : r(i,1)=i+1:r(i,2)=i-1:r(i,3)=i+4:r(i,4)=i-4
 5130 next i
 5140 for i=0 to 24 step 12
 5150 : for j=1 to 9 step 4: r(i+j+3,1)=0:r(i+j,2)=0:next j
 5160 : for j=1 to 4:r(i+j+8,3)=0:r(i+j,4)=0:next j
 5170 next i
 5180 r(1,5)=16:r(7,5)=15:r(32,6)=13:r(13,5)=32:r(35,6)=18:r(18,5)=35
 5190 for i=1 to 15:read rm:read mv:r(rm,mv)=0:next i
 5200 rem * init parameters *
 5210 rm=36:po=1:lp=1:rl=0:lo=0:nw=0:rt=0:rr=0
 5300 rem * arrays vullen *
 5310 in=-1
 5320 for i=1 to 14:read m$(i):next i
 5330 for i=1 to 12:read t$:gosub 4000:t$(i)=tn$:next i
 5340 for i=1 to 6:read t$:gosub 4000:h$(i)=tn$:next i
 5350 for i=1 to 36:read t$:gosub 4000:d$(i)=tn$:next i
 5360 for i=1 to 12:read t(i):next i
 5370 for i=1 to 6:read h(i,1),h(1,3):h(i,2)=1:next i
 5380 for i=1 to 8:read s(i):next i
 5390 in=0
 5400 return
 5500 data 21,1,22,2,22,1,23,2,18,1,19,2,16,3,20,4,11,1,12,2,7,1,8,2,7,4,3,3,2,1
 5510 data oost,west,noord,zuid,omhoog,omlaag,doden,help,meenemen,neerleggen
 5515 data status,verband,lantaarn,lezen
 5520 data cd kzmszzqm,cd gzri,cd vzsdqyzj,gds jnnjandj,gds ozlekds
 5522 data gds udqazmc,gds yvzzqc
 5525 data gds jndjid,gds khbgzzl uzm h.s.,gds lnmrsdqkhbgzzl
 5530 data cd fdgzjsd rkzmf,cd cncd gnmc
 5535 data h.s.,lnmrsdq,rkzmf,gdkkdgnmc,azqadbtd,anl
 5540 data qdrdsfqns,m-fqns,fdgdhld cdtq,bnmsqnkdjzldq,f-fqns,d-fqns,o-fqns
 5545 data yvzqsd jzldq,z-fqns,gnkkd fqns,n-fqns,kddfsd
 5550 data jkdhmd fqns,qnsrfqns,rszmjfqns,cqzjdmfqns,rkzmfdmfqns,fdkd fqns
 5555 data yzmcazmj,fkhaadqfqns,undcrdkfqns,dhmcdfqns
 5560 data fdjkdtqcd fqns,hirfqns,nodm okdj,anrrdm,anrrdm,anrrdm,anrrdm,anrrdm
 5565 data anrrdm,anrrdm,anrrdm,anrrdm,anrrdm,anrrdm
 5570 data 34,30,28,21,14,15,13,0,0,0,0,0
 5580 data 34,2,16,15,17,4,29,2,8,1,25,1
 5590 data 1,5,9,10,11,7,6,2
