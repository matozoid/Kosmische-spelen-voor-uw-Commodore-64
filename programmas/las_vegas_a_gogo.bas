    2 poke 53281,7
    5 rem **las vegas a gogo**
   10 sc=1024:cl=55296:cr=54272
   20 def fnr(x)=int(rnd(1)*x+1):x=rnd(-ti)
  100 dim wf$(13),r(2,13),ja(13):ja(5)=-1:ja(6)=-1:ja(7)=-1
  110 for v=1 to 13:read wf$(v),r(1,v),r(2,v):next v
  120 data a,,,k,,,q,,,j,,,*,8,40,"Q",8,40,$,7,30
  130 data "A",5,25,"S",3,20,"Z",3,20,"+",2,20,#,2,10,%,,
  200 dim jp(4),jf(4),jc(4)
  210 for jo=1 to 4:read jp(jo),jf(jo):next jo
  220 data 293,1,294,11,296,17,297,10
  300 dim wp(3),v(4),hv(3):wp(1)=211:wp(2)=213:wp(3)=215
  310 dim hp(3),hf$(3):hp(1)=453:hp(2)=455:hp(3)=457
  320 ho$="{rvon}h{rght}h{rght}h"
  400 dim gp(4),gv(4):gp(1)=32:gp(2)=76:gp(3)=112:gp(4)=69
  410 br$="             "
  500 nj=4:nh=0:ng=0:gw=0:ni=0:nt=-1
  510 pl$="{home}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}                                       {up}{rght}{wht}{rvon}"
  515 rem 39 spaties
  520 h$=left$(pl$,12)+"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}"
  530 for l=cr to cr+24: poke l,0: next l
  540 poke cr+6,134: poke cr+5,16
  550 hf=88:lf=115:dr=40
  560 poke cr+24,15
  570 goto 3000
  599 rem geld inwerpen
  600 for ad=sgn(in) to in step sgn(in)
  610 : print "{home}total:"mo+ad"{lgrn}  "
  620 : if in>0 then gosub 2700
  630 : if in<0 then for i=0 to 2:hf=38:lf=126:gosub 2700
  640 next ad
  650 hf=88:lf=115
  660 mo=mo+in:return
  699 rem s1$/s2$ knipperen in inlezen in$
  700 print "{home}{down}{blk}{rvof}" s1$:for de=1 to 250:next de
  710 get in$:if in$<>"" then print "{home}{down}{blk}" s2$: return
  720 print "{home}{down}{blk}" s2$:for de=1 to 250:next de
  730 get in$:if in$<>"" then return
  740 goto 700
  799 rem ** stop dubbele punten
  800 do=0:print"{home}{down}       "
  810 for jo=1 to 4
  820 : poke sc+jp(jo),jf(jo):poke cl+jp(jo),0:jc(jo)=0:next jo
  830 nj=4:return
  899 rem ** jackpot
  900 for i=1 to 4:print"{home}{down}{down}{down}                 {home}{down}{down}{down}{grn}";
  910 : hf=64:lf=188:gosub 2700
  930 print"j";:next i
  940 hf=88:lf=115
  950 return
 1000 gosub 2700:print"{clr}{blk}total: 0"
 1010 print"{down}{down}{down}{down}{down}"tab(12)"{CBM--}{rvon}{CBM-V}     {CBM-C}{blk}{CBM-K}"
 1020 for i=1 to 4:printtab(12)"{CBM--}{rvon}       {CBM-K}":next i
 1030 printtab(12)"{CBM--}{rvon}        "
 1040 printtab(12)"{CBM--}{CBM-C}{rvon}     {rvof}{CBM-V}"
 1050 for i=1 to 6:printtab(13)"{CBM--}{rvon}     ":next i
 1060 printtab(12)"{CBM--}{rvon}{CBM-V}     {CBM-C}"
 1070 printtab(11)"{CBM--}{rvon}{CBM-V}       {CBM-C}"
 1100 print"{home}{down}{down}{down}{down}{down}{down}{red} %  =  1"
 1105 print"{home}{down}{down}{down}{down}{down}{down}"
 1110 for v=12 to 5 step -1
 1120 : print"{red}-"wf$(v)wf$(v)"-= "r(1,v)
 1125 next v
 1130 print"{home}{down}{down}{down}{down}{down}"
 1140 for v=12 to 5 step -1
 1150 : print tab(25)"{red}"wf$(v)wf$(v)wf$(v)" ="r(2,v);
 1170 print:next v :return
 1199 rem ** variabelen aanpassen
 1200 nt=nt+1:if wi>0 then hb=-1:wi=0
 1210 for ho=1 to 3:hf$(ho)=" ":poke sc+hp(ho),160:next ho
 1220 if do then 1270
 1230 for jo=1 to 4:if jc(jo)=0 then 1260
 1240 : jc(jo)=jc(jo)-1:if jc(jo)>0 then 1260
 1250 : nj=nj+1:poke sc+jp(jo),jf(jo):poke cl+jp(jo),0
 1260 next jo:goto 1280
 1270 dc=dc-1:if dc<=0 then gosub 800
 1280 print"{home}{down}{down}{down}{down}" spc(11) "            "
 1290 if ja then jc=jc-1:print"{home}{down}{down}{down}" spc(jc) " ":if jc<=0 then ja=0
 1300 if mo>mm then mm=mo
 1310 return
 1399 rem ** geen geld genoeg
 1400 hb=-1:gosub 800
 1410 ja=0:print"{home}{down}{down}{down}               "
 1420 print pl$ tab(10) "insert or end";
 1430 s1$="insert (i)":s2$=br$:gosub 700
 1440 if in$="p" then 1430
 1450 return
 1499 rem ** hold mogelijk
 1500 print pl$ tab(5)"insert,hold,play,end";
 1510 s1$=h$+ho$:s2$=h$+hf$(1)+"{rght}{rvof}"+hf$(2)+"{rght}{rvof}"+hf$(3)
 1520 gosub 700:ho=val(in$):if ho=0 or ho>3 then return
 1530 nh=nh+1:if hf$(ho)=" " then hf$(ho)="{rvon}{CBM-W}":goto 1510
 1540 hf$(ho)=" "
 1550 goto 1510
 1599 rem geen hold mogelijk
 1600 print pl$ tab(8) "insert, play or end";
 1610 s1$="{down}???":s2$="{down}   ":gosub 700
 1620 return
 1699 rem ** gokken of innen?
 1700 print pl$;:if hb then 1720
 1710 print tab(10) "hold, ";
 1720 print tab(12) "gamble,collect";
 1730 goto 1610
 1799 rem ** draaien van het rad
 1800 for wd=1 to 3:if hf$(wd)<>" " then 1830
 1810 : fi=fnr(100):if fi<5 then v(wd)=fi-8*(jc(fi)>0):goto 1830
 1820 : v(wd)=5-(fi>7)-(fi>10)-(fi>13)-(fi>23)-(fi>36)-(fi>49)-(fi>68)-(fi>87)
 1830 : for de=2 to 500:next de:hf=40:lf=200:gosub 2700
 1840 : poke sc+wp(wd),(asc(wf$(v(wd))) and 63)
 1850 : print h$ "{up}{up}{rvon}{blk}" spc(wp(wd)-wp(1)) wf$(v(wd))
 1860 : hf=88:lf=115
 1870 next wd:return
 1899 rem ** jokers
 1900 j=0:for wd=1 to 3:v=v(wd)
 1910 : if v>4 then fv=v:goto 1950
 1920 : jw=wd:j=j+1
 1930 : if jc()>0 then 1950
 1940 : print "{home}{down}{down}" spc(jp(v)-80) "{CBM--} ":jc(v)=20:nj=nj-1
 1950 next wd:do=(nj=0):if do then dc=15:print "{home}{down}{grn}double!"
 1960 return
 1999 rem ** bereken winst
 2000 hv=13:on j goto 2030,2010,2070
 2010 if not (ja and fv>10) then hv=fv
 2020 goto 2070
 2030 v(0)=v(3):v(4)=v(1):if ja and v(jw-1)<>v(jw+1) then 2070
 2040 v(0)=15:v(4)=15
 2050 if v(jw+1)>v(jw-1) then hv=v(jw-1):goto 2070
 2060 hv=v(jw+1)
 2070 for wd=1 to 3:hv(wd)=v(wd):if v(wd)<5 then hv(wd)=hv
 2080 next wd:if hv(1)<>hv(2) or hv(2)<>hv(3) then 2100
 2090 if ja(hv(1)) then ja=-1:jc=15:gosub 900
 2099 rem ** bereken winst
 2100 for wd=1 to 3:if hv(wd)=13 then wi=wi+1
 2110 next wd:if ja then wi=10*wi
 2120 ns=-(hv(1)=hv(2))-(hv(2)=hv(3)):wi=wi+r(ns,hv(2))
 2130 if do then wi=2*wi
 2140 return
 2199 rem ** gokken
 2200 dt=1:gv(1)=2*wi:gv(2)=0:gv(3)=int(3*wi/2):gv(4)=int(wi/2)
 2210 ng=ng+1:print pl$ tab(8) "     stop     ";
 2220 for li=1 to 3:pload"{home}" spc(40*li-12) "{blu}{rvon}            ":next:rem 12 spaties
 2230 r=r+1:if r>4 then r=1
 2240 print"{home}{rvon}" spc(gp(r)) gv(r):hf=16*r:lf=47*r:gosub 2700:print"{home}{down}{down}{rvof}  "
 2250 if in$<>"s" then get in$:goto 2270
 2260 dt=(1+rnd(1))*dt:for de=1 to dt:next de:if dt>500 then 2280
 2270 print"{home}{rvon}" spc(gp(r)+1) "   ":goto 2230
 2280 hf=88:lf=115:for li=1 to 3:print"{home}" spc(40*li-12) "            ":next li
 2290 gw=gw+gv(r)-wi:wi=gv(r):return
 2399 rem ** einde van het spel
 2400 print"{clr}":hf=19:lf=63;gosub 2700
 2410 print"ingeworpen:";:x=ni:gosub 2500
 2420 print"uitbetaald:";:x=mo/4:gosub 2500
 2425 print"maximum in"
 2430 print"1 beurt:   ";:x=mm/4:gosub 2500
 2440 print"gamble winst:";:x=gw/4:gosub 2500
 2450 print"aantal hold's: ";nh
 2460 print"aantal gamble: ";ng
 2470 print"aantal beurten:";nt
 2480 return
 2500 if x=0 then x$=br$+".000":goto 2520
 2510 x$=br$+str$(int(x*100)/100+.001)
 2520 print tab(13) "fl" mid$(x$,len(x$)-7,7):print
 2530 return
 2600 print"{home}{down}{down}{down}{down}{down}{down}{blk}{rvon}" spc(20);:gosub 2660
 2610 for i=0 to 3:print"{rvof}{f7} {rvon}{down}{f7}{CBM-J}";:gosub 2660:next i
 2620 for wd=1 to 3: if hf$(wd)=" " then poke sc+wp(wd),32
 2630 next wd
 2640 for i=0 to 3:print"{left}{CBM--}{up}{blk}{CBM-J}";:gosub 2660:next i
 2650 return
 2660 for de=0 to 80:next de
 2670 return
 2700 rem *sound*
 2720 poke cr+1,hf:poke cr,lf
 2735 poke cr+4,17
 2740 for t=1 to dr:next t
 2745 poke cr+4,16
 2750 return
 2999 rem *** hoofdprogramma
 3000 gosub 1000:rem schermlayout
 3010 gosub 1200:rem aanpassen variabelen
 3020 on -2*hb-(mo>1)+1 gosub 1400,1500,1400,1600
 3030 ca=-(in$="i")-2*(in$="p")-3*(in$="e")
 3040 on ca goto 3100,3200,4000
 3050 goto 3020
 3100 ni=ni+1:in=4:gosub 600
 3110 if mo>mm then mm=mo
 3120 goto 3020
 3200 in=-2:goto 600
 3210 gosub 2600:gosub 1800:rem draaien van het rad
 3220 if do then 3240
 3230 gosub 1900:rem jokers
 3240 gosub 2000:rem winst
 3250 if hf$(1)<>" " or hf$(2)<>" " or hf$(3)<>" " then 3280
 3260 hb=0:lw=wi:if wi>0 then 3300
 3270 goto 3010
 3280 hb=-1:if wi>lw then 3300
 3290 print"{home}{down}{down}{down}{down}{blk}"spc(11)" you lost   ":hf=21:lf=154:gosub 2700:for i=0to2000
 3295 next i:hf=88:lf=115:goto 3010
 3300 print"{home}{down}{down}{down}{down}{blk}" spc(11) "you won"wi"{left}  "
 3310 for du=1 to wi:hf=108:lf=223:gosub 2700:for i=0 to 50:next i:hf=88:lf=115
 3320 next du
 3330 if mo<2 then hb=-1
 3340 if wi>499 then 3400
 3350 gosub 1700:rem instructie invoeren
 3360 ca=-(in$="h" and not hb)-2*(in$="g")-3*(in$="c")
 3370 on ca goto 3600,3500,3400
 3380 goto 3340
 3400 in=wi:gosub 600:goto 3010
 3500 hb=-1:gosub 2200:rem gokken
 3510 if wi>0 then 3300
 3520 goto 3290
 3600 wi=0:goto 3010
 4000 gosub 2400:rem einde
 4005 poke 54296,0
 4010 end
