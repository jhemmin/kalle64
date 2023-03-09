100 REM *******************************
105 REM *                             *
110 REM *       crached by the        *
120 REM *    (c) crached machine      *
122 REM *   "{D*20}"    *
125 REM *                             *
130 REM *    c64:lle crached machine  *
135 REM *             oy              *
140 REM *******************************
145 :
150 REM paaohjelma
160 REM
170 GOSUB380:REM alku
190 GOSUB320:REM
200 IF l$=" loppu "THEN270
220 GOSUB830:REM tee vastaus
230 GOSUB1600:REM arkistoi
240 GOSUB760 :REM ja vastaa
250 GOTO190:REM   -->loop
270 GOSUB640:REM lopetus
280 END
290 ::
300 REM lue lause
310 ::
320 PRINTTAB(sy+1):INPUTl$:IFl$=""THEN320
330 l$=" "+l$+" ":RETURN
350 ::
360 REM alku
370 ::
380 ks=17:kp=2:am=45:lm=8:sm=7
385 PRINT"{clear}{down*9}{right*11}hetki{.*3}"
390 DEF FNs(s)=INT(RND(-ti)*s+1)
400 DIM ks$(ks,1),kp$(kp,1),mv$(5),mv%(5),li$(30)
405 DIM sn$(am,sm),lm$(am,lm),ae%(am)
410 REM === kaantosanat === ks
420 FORi=1TOks:READks$(i,0),ks$(i,1):NEXT
430 DATA mina,sina,sina,mina,me,te,minun,sinun,sinun,minun,meidan,teidan,sinut
431 DATA minut,meidat,teidat,sinua,minua,minua,sinua
440 DATA olen,olet,olet,olen,minulle,sinulle,sinulle,minulle,minut,sinut
441 DATA teidat,meidat,olemme,olette
450 REM === kaantopaatteet === kp
460 FORi=1TOkp:READkp$(i,0),kp$(i,1):NEXT
470 DATA ni,si,si,ni
480 REM === avmt ja vstkst ===
490 FORi=0TOam:READas$:IFas$="l"THENam=i-1:GOTO570
500 GOSUB1360
510 FORj=1TOlm+1:READl$
515 IFl$="@"THENlm$(i,0)=STR$(j-1)+"*"+STR$(FNs(j)-1):GOTO540
520 lm$(i,j)=l$
530 NEXTj
540 NEXTi:RESTORE
550 REM*** intro ***
570 PRINT"{clear}{down}terve,olen kalle ja kutistan kallosi ja luotaan tajuntasi tasoja."
575 PRINT"{down}no niin - rentouduhan niin aloitamme
576 PRINT"istunnon. jos kuitenkin ensiksi antaisitnimesi tanne rekisteriin.
581 INPUTn$:IFn$=""OR n$=" " THEN 581
590 PRINT"{down}hienoa ";n$;" , kerrohan nyt minulle mikaon ongelmasi"
600 PRINT:RETURN
610 ::
620 REM    lopetus
630 ::
640 k=0
650 PRINT"{clear}{down}{space*3}k e s k u s t e l u n a i h e e t{down}
660 FORi=0TOam
670 IF i=15ORi30THENINPUT"paina{.*3}";a$
680 PRINTi+k;".";'LEFT$(sn$(i+k,1),10);
690 PRINTTAB(16)"i";
700 FORj=0TOae%(i+k:PRINT"+";:NEXT
710 PRINTae%(i+k)
711 GETa$:IFa$=""THEN 711
712 k=k+i:GOTO650
720 NEXT:RETURN
730 ::
740 REM     vastaa
750 ::
760 IFNOT(lopussa$="koodi")THENli$=""
770 PRINTTAB(sy+1);"-";va$;li$
780 va$="":li$="":RETURN
800 ::
810 REM     tee vastaus
820 ::
830 GOSUB1900:REM toistoa?
840 IFts$="on"THEN870
850 GOSUB1230:REM onko avain?
860 IF a$="avain ei"THENGOSUB1700:GOSUB1490:GOTO890
870 GOSUB1490:REM lue vastaus
880 GOSUB930:REM tee liitos
890 RETURN
900 REM
910 REM***  tee liitos  ***
920 REM
930 GOSUB1060:REM kas.liitos
940 IFli$=" "THEN970
950 ll$=LEFT$(li$,LEN(li$)-1):GOSUB1110:REM kaanna
970 RETURN
980 ::
990 FORi=1TOb
1000 FORj=1TOks:IFli$(i)=ks$(j,0)THENli$(i)=ks$(j,1):GOTO1020
1010 NEXT
1020 FORk=1TOkp
1021 s$=kp$(k,0):IFRIGHT$(li$(i),LEN(s$))=s$THENxx=1
1022 IFxx=1THENli$(i)=LEFT$(li$(i),LEN(li$(i))-LEN(s$))+kp$(k,1):xx=0:GOTO1040
1030 NEXT
1040 NEXT:RETURN
1045 REM
1050 li$="":FORi=1TOb:li$=li$+" "+li$(i):NEXT:RETURN
1055 REM
1060 ll$="":li$=RIGHT$(l$,LEN(l$)-l)+" "
1070 FORi=1TOLEN(li$)
1075 IFMID$(li$,i,1)=" "THENli$=RIGHT$(li$,LEN(li$)-i):GOTO1090
1080 NEXT
1090 RETURN
1091 ::
1100 REM kaanna sanat, paatteet
1105 ::
1110 GOSUB1160:REM li$->li$()
1120 GOSUB990 :REM kaanna
1130 GOSUB1050:REM li$()->li$
1140 RETURN
1150 ::
1160 a$=LEFT$(li$,LEN(li$)-1):b=0
1170 FORi=1TO10:li$(i)="":NEXT
1180 b=b+1:FORi=1TOLEN(a$)
1182 IFMID$(a$,i,1)=" "THEN1195
1190 NEXT:RETURN
1195 li$(b)=LEFT$(a$,i-1):a$=MID$(a$,i+1,LEN(a$)-LEN(li$(b))-1):GOTO1180
1200 ::
1210 REM loytyyko avainsana?
1220 ::
1230 a$="avain ei":REM oletus
1240 REM jokaiselle avaimelle
1250 FORi=2TOam
1260 REM jokaiselle synonyymille
1270 FORj=1TOVAL(sn$(i,0))
1280 REM onko syno jonossa
1290 FORl=1TOLEN(l$)-LEN(sn$(i,j))+1
1300 IFsn$(i,j)=MID$(l$,l,LEN(sn$(i,j)))THEN1325
1310 NEXTl,j,i
1320 RETURN
1325 as$=sn$(i,j):a$="avain on":a=i:as=a:GOTO1320
1330 ::
1340 REM taulukoi synonyymit
1350 ::
1360 a$=" "+as$+"*":a=0
1370 a=a+1:FORl=1TOLEN(a$)
1375 IFMID$(a$,l,1)="*"THEN1460
1380 NEXT
1390 REM === ja muotoile ne ===
1400 FORl=1TOa
1402 IFRIGHT$(sn$(i,l),1)="-"THEN1462
1410 sn$(i,l)=sn$(i,l)+" "
1420 sn$(i,l)=" "+sn$(i,l)
1430 NEXT
1440 sn$(i,1)=RIGHT$(sn$(i,1),LEN(sn$(i,1))-1)
1450 sn$(i,0)=STR$(a-1):RETURN
1460 sn$(i,a)=LEFT$(a$,l-1):a$=MID$(a$,l+1,LEN(a$)-LEN(sn$(i,a))-1):GOTO1370
1462 sn$(i,l)=LEFT$(sn$(i,l),LEN(sn$(i,l))-1):GOTO1420
1465 ::
1470 REM valitse lause
1480 ::
1490 lopussa$=""
1500 ho=VAL(RIGHT$(lm$(a,0),1)):hm=VAL(LEFT$(lm$(a,0),2))
1510 ho=ho+1:IFho>hmTHENho=1
1520 lm$(a,0)=STR$(hm)+"*"+STR$(ho)
1530 v$=lm$(a,ho):va$=v$
1540 IFRIGHT$(v$,1)="="THENva$=LEFT$(v$,LEN(v$)-1):lopussa$="koodi"
1550 ae%(a)=ae%(a)+1
1560 RETURN
1570 ::
1580 REM arkistoi vast ja liit
1590 ::
1600 IFmv%(1)=asORas<2THEN1650
1610 sy=sy+1
1620 FORi=5TO1STEP-1:mv%(i)=mv%(i-1):mv$(i)=mv$(i-1):NEXT
1630 mv%(1)=as:as=0
1640 mv$(1)=ll$:ll$=""
1650 RETURN
1670 ::
1680 REM muistele ja vastaa
1690 ::
1700 lv=lv+1:IFlv>2THENlv=1
1710 ON lv GOTO 1730,1770
1720 REM 1 == edellinen avain ==
1730 a=mv%(1):IFa=0THEN1700
1740 IFmv$(1)=""THENli$="":GOSUB1850:GOTO1810
1750 li$=mv$(1)+" ":GOSUB1850:GOSUB1110:GOTO1810
1760 REM 2 == edellinen liitos ==
1770 IFmv$(1)=""THENa=1:GOTO1810
1780 l$=" "+mv$(1):li$=mv$(1)+" ":GOSUB1850:GOSUB1110
1790 GOSUB1230:REM onko avain
1800 IFa$="avain ei"THEN1700
1810 l=0:RETURN
1815 ::
1840 REM *** nosto ***
1850 FORi=1TO4
1860 mv$(i)=mv$(i+1):mv%(i)=mv%(i+1):NEXT:mv$(5)="":mv%(5)=0:sy=sy-1:RETURN
1870 ::
1880 REM onko toistoa?
1890 ::
1900 ts$="":IFl$=el$THENa=0:ts$="on"
1910 el$=l$:RETURN
1920 REM
1930 REM-------------------------------
1940 REM vastaus data
1950 REM
1960 DATA jos toistoa
1970 DATA ala toista itseasi!,sanoit tuon jo kerran!,ala viitsi jankuttaa!
1971 DATA keksi jotakin muuta!,etko keksi muuta?,@
1980 DATA ei avainta
1990 DATA onko sinulla psykologisia ongelmia?,mita tuo tuo sinulle mieleen
1991 DATA ymmarran...,en ymmarra sinua aivan taysin
1992 DATA voitko hiukan tasmentaa ajatuksiasi,tuohan on mielenkiintoista,@
2000 DATA voit-*osaat-
2010 DATA etko usko etta osaan=,ehka sina haluisit=,haluat siis minun voivan=,@
2020 DATA voin-*osaan-
2030 DATA ehket halua=,haluaisitko todella=,@
2040 DATA olet-
2050 DATA miksi en olisi=,miellyttaako sinua etta olen=
2051 DATA naet minussa vain haavekuvasi-jotakin lapsuudestasi ?
2052 DATA toivoisitko olevasi=,joskus unet tulevat tosiksi,@
2060 DATA en*mina en
2070 DATA etko todellakaan=,miksi et=,hmm...kerrohan jotain haluistasi
2071 DATA hairitseeko sinua etta=,voitko kuvitella muuta kuin ettet=,@
2080 DATA miksi*miksei
2090 DATA mita ajattelet kysyessasi tuollaisia?,niin todellakin-miksi=
2091 DATA syvallisiin kysymyksiin on syvalliset vastaukset-jatka
2092 DATA miksi yleensa mitaan,@
2100 DATA oletko
2110 DATA miksi sinua kiinnostaa olenko vai enko ole=
2111 DATA olisiko parempi jos en olisi=,@
2120 DATA viha
2130 DATA vihantunne juontaa usein juurensa lapsuustraumoista
2131 DATA vihaaminen on hyodytonta energian tuhlausta,vihaatko itseasi?
2132 DATA vihaatko sukulaisia?,vihan voi kaantaa rakkaudeksi,@
2140 DATA huuta-*nalkut-*rayha-
2150 DATA on tarkeata etta osaa purkaa tunteensa
2151 DATA hmm..ehka hieman epahienoa kaytosta,siihen on varmaan omat syynsa,@
2160 DATA ryyp-*joi-*juo-*viina*alkoholi-
2170 DATA alkoholin kaytto haittaa ystavyyssuhteita,pysy sina irti viinasta!!
2171 DATA miten tama liittyy muihin ongelmiisi,miksi luulet etta ihmiset juovat
2172 DATA@
2180 DATA petta-*uskoton*vieraissa
2190 DATA hairahduksia sattuu joskus meille kaikille
2191 DATA teidan olisi syyta keskustella ongelmistanne keskenanne
2192 DATA mista luulet uskottomuuden johtuvan?
2193 DATA mita tunnette toisianne kohtaan?,@
2200 DATA pelka-*pelan-
2210 DATA oletko kauankin pelannyt=,pelkaatko juuri nyt=
2211 DATA pelko tuntuu kahlitsevan kayttaytymistasi
2212 DATA oletko yrittanyt vapautua peloistasi jotenkin?
2213 DATA turha huolestua-pelkaaminen on ihan tavallista,@
2220 DATA uskon
2230 DATA uskonasioista ei kannata kiistella,...uskot=
2231 DATA kerrohan jotain rippikoulustasi
2232 DATA mita tunnet pastoriasi kohtaan?,@
2240 DATA minusta tuntuu*tunnen
2250 DATA kerrohan lisaa tuntemuksistasi,tuntuuko sinusta usein=
2251 DATA nautitko tuntemuksistasi?,tunteminen on tarkeaa
2252 DATA aiheuttaako se sinulle syyllisyydentunteita?,@
2260 DATA seks-*sukupuoli-*rakastel-
2270 DATA eiko tuo ole hiukan perverssia?,tunnetko seksuaalista vetoa aitiisi?
2271 DATA taidat olla kokenutkin rakastaja!
2272 DATA kerro minulle fantasioistasi
2273 DATA mita vastakkainen sukupuoli sinulle sitten oikein merkitsee?
2274 DATA miten lapsuudenkodissasi suhtauduttiin sukupuoliasioihin?,@
2280 DATA halu-*himo-*intohimo-
2290 DATA mita sinulle merkitsisi jos saisit=,miksi haluat=
2291 DATA oletetaanpa etta saisit=,entapa jos et koskaan saisi=
2292 DATA minakin haluan joskus=,@
2300 DATA uneks-*kuvit-*uni*kuvitelma*unta
2310 DATA mita unesi tuo mieleesi?,uneksitko useinkin?
2311 DATA keita hahmoja unissasi esiintyy?,hairitsevatko unesi sinua?
2312 DATA hienoa-unet parantavat!,@
2320 DATA mieheni*aviomieheni*vaimoni*naaraani*puoliso-*aviopuoliso-
2330 DATA miksi han=,mita sinulle merkitsee etta han=
2331 DATA oletko pahoillasi etta han=,pettaako han sinua?
2332 DATA kuvailisitko hiukan tarkemmin suhdettanne,@
2360 DATA isa-*aiti-*mutsi-*faija-*vanhem-
2370 DATA kerrohan lisaa perheestasi,miten suhtauduit vanhempiisi murrosiassa?
2371 DATA miten vanhempasi suhtautuivat sinuun?
2372 DATA ongelmasi saattaa johtua vanhempiesi valisesta suhteesta-jatka...,@
2380 DATA sisko-*veli-*velje-*syster-*broidi-
2390 DATA voitko tasmentaa ajatuksiasi sisaruksistasi?
2391 DATA oletko halunnut sisaruksia?,kuinka usein tapaat sisaruksiasi?
2392 DATA miten sukulaisesi suhtautuvat tahan?,@
2400 DATA tyt-*tyttoystava-*naise-
2410 DATA kerrohan jotain haaveistasi,mita tyttoystava merkitsee sinulle?
2411 DATA mita kuvittelet juuri nyt?,pitaisiko tyttoystavasi muistuttaa aitiasi?
2412 DATA kuvaile suhdettasi vastakkaiseen sukupuoleen,@
2420 DATA poik-*poj-*poikaystava-*miesystava-*miehe-
2430 DATA kuvailisitko tarkemmin toiveitasi,mita poikaystava merkitsee sinulle?
2431 DATA mita ajattelet juuri nyt?,pitaisiko poikaystavasi muistuttaa isaasi?
2432 DATA kuvaile suhdettasi vastakkaiseen sukupuoleen,@
2440 DATA ystav-
2450 DATA halut ehka keskustella ystavistasi?
2451 DATA olet ehka etsiytynyt vaaranlaisten ihmisten pariin
2452 DATA kerrohan mita tunnet ystaviasi kohtaan
2453 DATA tuo on hyvin tavallinen harhakasitys ja se johtuu libidon harhaumasta
2454 DATA sinulla on liian ideaalinen kuva ystavyydesta,@
2460 DATA suku-
2470 DATA mita ajattelet sukulaisistasi?,kerrohan joitain lapsuudenmuistojasi
2471 DATA olen samaa mielta kanssasi,tiedan-minullakin on sukulaisia
2472 DATA puhutaan valilla jostakin muusta,@
2480 DATA tietokone-*kone-
2490 DATA huolestuttavatko tietokoneet sinua?
2491 DATA pelkaatko tietokoneitten orjuuttavan ihmisia?
2492 DATA pelottavatko koneet sinua,miksi mainitsit koneet
2493 DATA mita tekemista koneilla on ongelmiesi kanssa,@
2500 DATA en voi*en osaa
2510 DATA mista tiedat ettet osaa=,onko tassa jotain syvempaa merkitysta?
2511 DATA ehka nyt osaat=,yrittanytta ei laiteta,mita oikein haluat ilmaista,@
2520 DATA olen*mina olen*olin*mina olin
2530 DATA taisit tulla tanne koska olet=,kuinka kauan olet ollut=
2531 DATA syyllisyyden tunteet ja pelot saattavat kalvaa pahasti
2532 DATA onko sinusta normaalia olla=,mita vanhempasi sanovat siihen etta olet=
2533 DATA @
2540 DATA sina
2550 DATA keskustelemme sinusta emmeka minusta,minako=
2551 DATA ethan vain puhu minusta,@
2560 DATA mita
2570 DATA miksi kysyt?,kiinnostaako tuo kysymys sinua?
2571 DATA mika vastaus olisi miellyttavin?,mita luulet?
2572 DATA kerrohan jotakin mita tulee nyt mieleesi,@
2580 DATA kuinka*mista
2590 DATA ajatteletko useinkin tuollaisia kysymyksia?
2591 DATA mita sina oikeastaan halut tietaa?,oletko kysynyt keltaan muulta?
2592 DATA oletko kysynyt sellaista aikaisemmin?
2593 DATA mita tulee mieleesi kysyessasi tuollaista,@
2600 DATA kuka
2610 DATA nimet eivat kiinosta minua,en valita mistaan nimista-jatka,@
2620 DATA anteeksi*olen pahoillani
2630 DATA ala turhaan pyytele anteeksi,miksi olet niin vaatimaton?
2631 DATA mita tuntemuksia sinulla on pyytaessasi anteeksi?
2632 DATA ala ole niin puolusteleva,milta se tuntuu?,@
2640 DATA ehka*ehkapa*kenties*melko
2650 DATA et vaikuta kovinkaan varmalta,miksi tuollainen savy?
2651 DATA etko voisi olla vahan varmempi,etko ole varma?,etko tieda?,@
2660 DATA ei
2670 DATA asennoidut hyvin kielteisesti,miksi muuten ei?
2671 DATA mina en olisi yhta varma,voisit koettaa suhtautua hiukan myonteisemmin
2672 DATA totuus on tarua ihmeellisempaa!,@
2680 DATA aina*joskus*usein
2690 DATA voitko hiukan tasmentaa?,milloin?,mita ajat takaa?
2691 DATA ihan ainako?,kaikki ei aina suju niin kuin pitaisi,@
2700 DATA minun mielestani*mielestani
2710 DATA oletko tosissasi sita mielta?,epailetko etta=
2711 DATA mielipiteet erottavat ihmisen elaimista-jatka
2712 DATA sinulla on jyrkkia mielipiteita!,@
2720 DATA samanlai-*samankaltai-
2730 DATA milla tapaa?,mita yhteista havaitset?
2731 DATA mita samanlaisuus tuo mieleesi?,mita muita yhteyksia huomaat?
2732 DATA tokkopa tuollaisia yhteyksia onkaan,@
2740 DATA kylla*joo*jep*tietenkin*tietysti
2750 DATA vaikutat aika elamanmyonteiselta,oletko aivan varma etta...=
2751 DATA ymmarran,...ahaa!,mm...alkaa selveta,@
2752 DATA raha-*vel-*palk-
2753 DATA mita raha merkitsee sinulle,mita tekisit jos saisit miljoonan lotossa
2754 DATA raha ei ole kaikki kaikessa,oletko pyytanyt palkankorotusta,@
2760 DATA haista -
2770 DATA eiko sinua yhtaan haveta kayttaa moista kielta
2771 DATA jos yrittaisit hieman rauhoittua, otahan iisisti
2772 DATA mika saattaa sinut moisen tunnekuohun valtaan?
2773 DATA olen pahoillani, jos loukkasin sinua
2774 DATA ala hermostu, vaikka joskus tekeekin hyvaa purkaa paineita,@
2780 DATA rakka-*raka-
2790 DATA niin, rakkaus on ihmeellinen ja ainutlaatuinen asia
2791 DATA millainen oli ensirakkautesi?,
2792 DATA muista, etta rakkaus murtaa kaikki esteet!,@
2990 DATAl:REM lopetuskoodi
3000 FORi=1TOam:PRINT"avain";i:FORj=1TOsm:PRINTsn$(i,j);"/";:NEXT:PRINT
3001 PRINT"{clear}{down}{=*40}{down}"
3002 PRINT"lausem*pointteri=";lm$(i,0):PRINT
3010 FORj=1TOlm:PRINTj;".."lm$(i,j):NEXT
3011 GETr$:IFr$=""THEN3011
3012 NEXT
