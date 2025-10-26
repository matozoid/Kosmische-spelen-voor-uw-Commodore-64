   10 rem **kleurenprobleem**
   20 print "{clr}":poke 36879,59
   30 dim a%(5,5):for i=0 to 4:read a%:for j=0 to 4:a%(i,j)=a%:next j,i
   40 data 28,5,31,158,30
   50 rem red,white,blue,yellow,green
   60 goto 510
  100 rem **schermlayout**
  110 print"{clr}{blk}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}U{SHIFT-*}6{SHIFT-*}{SHIFT-*}7{SHIFT-*}{SHIFT-*}8{SHIFT-*}{SHIFT-*}9{SHIFT-*}{SHIFT-*}0{SHIFT-*}I"
  120 for i=5 to 1 step -1:print spc(10) "B" spc(15);"B"
  130 : a$=right$(str$(i),1):print spc(10) a$;spc(15);a$
  140 : print spc(10) "B";spc(15);"B"
  150 next i:print"{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}J{SHIFT-*}6{SHIFT-*}{SHIFT-*}7{SHIFT-*}{SHIFT-*}8{SHIFT-*}{SHIFT-*}9{SHIFT-*}{SHIFT-*}0{SHIFT-*}K"
  160 print"{home}";:for i=0 to 4:for j=1 to 3:print:print spc(10) "{rvon}{rght}";:for k=0 to 4
  170 print chr$(a%(i,k));"   ";:next k,j,i
  180 return
  200 rem **verdraaien**
  210 for i=5 to 1 step -1:a%(a,i)=a%(a,i-1):next i
  220 a%(a,0)=a%(a,5):return
  230 for i=5 to 1 step -1:a%(i,a)=a%(i-1,a):next i
  240 a%(0,a)=a%(5,a):return
  500 rem **hoofdprogramma**
  510 gosub 110:for w=0 to 20:a=int(5*rnd(1))
  511 : on 1+2*rnd(1) gosub 210,230:gosub 160:next w
  520 get a$:if a$="q" then sys 65234
  530 a=val(a$):if a$="0" then a=10
  540 if a=0 then 550
  550 if a>5 then a=a-6:gosub 230:goto 570
  560 a=5-a:gosub 210
  570 gosub 160:goto 520
