170 GOTO380
190 GOTO320
200 IFl$=" loppu "THEN270
220 GOSUB830
230 GOTO1600
240 GOTO760
260 GOSUB640
270 GOTO640
280 END
320 PRINT"{blue}":INPUTvck$:IFvck$=""THEN320
321 l$=vck$
330 l$=" "+l$+" ":GOTO200
380 ks=17:kp=2:am=40:lm=6:sm=6
385 PRINT"{clear}{down*9}{right*6}hetki{.*3}"
390 DEFFNs(s)=INT(RND(1)*s)+1
400 DIMks$(ks,1),kp$(kp,1),mv$(5),mv%(5),li$(30),sn$(am,sm),lm$(am,lm),ae%(am)
420 FORi=1TOks:READks$(i,0),ks$(i,1):NEXT
430 DATAmin[,sin[,sin[,min[,me,te,minun,sinun,sinun,minun,meid[n,teid[n,sinut,minut
431 DATAmeid[t,teid[t,sinua,minua,minua,sinua,olen,olet,olet,olen,minulle,sinulle
440 DATAsinulle,minulle,minut,sinut,teid[t,meid[t,olemme,olette
460 FORi=1TOkp:READkp$(i,0),kp$(i,1):NEXT
470 DATAmi,si,si,ni
490 FORi=0TOam:READas$:IFas$="l"THENam=i-1:GOTO560
500 GOSUB1360
510 FORj=1TOlm+1:READl$:IFl$="@"THENlm$(i,0)=STR$(j-1)+"*"+STR$(FNs(j)-1):GOTO540
520 lm$(i,j)=l$
530 NEXTj
540 NEXTi:RESTORE
560 REM
580 PRINT"no niin, rentouduhan niin aloitamme istunnon. jos kuitenkin antaisit";
581 PRINT" nimesi t[nne rekisteriin":INPUTn$
582 PRINT"{down}hienoa "n$", kerrohan nyt mik[ on ongelmasi"
583 PRINT:GOTO190
640 k=0
650 PRINT"{clear}k e s k u s t e l u n{space*7}a i h e e t":PRINT
655 REM
660 FORi=0TO19:IFi+k>amTHEN720
670 PRINTi+k"..";LEFT$(sn$(i+k,1),10);
690 FORj=0TOae%(i+k):PRINT"+";:NEXT
700 PRINTae%(i+k)
710 NEXT:PRINT:PRINT"jatka{.*3}";:k=i
715 GETa$:IFa$<>""THEN650
717 GOTO715
720 PRINT"kiitos keskustelusta ja hyv[[ jatkoa":END
760 IFNOT(lopussa$="koodi")THENli$=""
770 REM
771 PRINT"-";va$;li$
780 va$="":li$="":GOTO190
830 GOTO1900
840 IFts$="on"THEN870
850 GOSUB1230
860 IFa$="avain ei"THENGOSUB1700:GOSUB1490:GOTO890
870 GOSUB1490
880 GOSUB930
890 RETURN
930 GOSUB1060
940 IFli$=" "THEN970
950 ll$=LEFT$(li$,LEN(li$)-1):GOSUB1110
970 RETURN
990 FORi=1TOb
1000 FORj=1TOks:IFli$(i)=ks$(j,0)THENli$(i)=ks$(j,1):GOTO1020
1010 NEXTj
1020 FORk=1TOkp
1021 s$=kp$(k,0)
1022 IFRIGHT$(li$(i),LEN(s$))=s$THENvcr=1
1023 IFvcr=1THENli$(i)=LEFT$(li$(i),LEN(li$(i))-LEN(s$))+kp$(k,1):vcr=0:GOTO1040
1030 NEXTk
1040 NEXTi:RETURN
1050 li$="":FORi=1TOb:li$=li$+" "+li$(i):NEXT:RETURN
1060 ll$="":li$=RIGHT$(l$,LEN(l$)-l)+" "
1070 FORi=1TOLEN(li$):IFMID$(li$,i,1)=" "THENli$=RIGHT$(li$,LEN(li$)-i):GOTO1090
1080 NEXT
1090 RETURN
1110 GOSUB1160
1120 GOSUB990
1130 GOSUB1050
1140 RETURN
1160 IFli$=""THENli$=" "
1161 a$=LEFT$(li$,LEN(li$)-1):b=0
1170 FORi=1TO10:li$(i)="":NEXT
1180 b=b+1:FORi=1TOLEN(a$)
1181 IFMID$(a$,i,1)=" "THENli$(b)=LEFT$(a$,i-1):vcc=1
1182 IFvcc=1THENa$=MID$(a$,i+1,LEN(a$)-LEN(li$(b))-1):vcc=0:GOTO1180
1190 NEXT:RETURN
1230 a$="avain ei"
1250 FORi=2TOam
1270 FORj=1TOVAL(sn$(i,0))
1290 FORl=1TOLEN(l$)-LEN(sn$(i,j))+1
1300 IFsn$(i,j)=MID$(l$,l,LEN(sn$(i,j)))THENas$=sn$(i,j):a$="avain on":a=i:as=a:GOTO1320
1310 NEXTl,j,i
1320 RETURN
1360 a$=" "+as$+"*":a=0
1370 a=a+1:FORl=1TOLEN(a$)
1371 IFMID$(a$,l,1)="*"THENsn$(i,a)=LEFT$(a$,l-1):vvc=1
1372 IFvvc=1THENa$=MID$(a$,l+1,LEN(a$)-LEN(sn$(i,a))-1):vvc=0:GOTO1370
1380 NEXT
1400 FORl=1TOa
1401 IFRIGHT$(sn$(i,l),1)="-"THENsn$(i,l)=LEFT$(sn$(i,l),LEN(sn$(i,l))-1):GOTO1420
1410 sn$(i,l)=sn$(i,l)+" "
1420 sn$(i,l)=" "+sn$(i,l)
1430 NEXT
1440 sn$(i,1)=RIGHT$(sn$(i,1),LEN(sn$(i,1))-1)
1450 sn$(i,0)=STR$(a-1):RETURN
1490 lopussa$=""
1500 ho=VAL(RIGHT$(lm$(a,0),1)):hm=VAL(LEFT$(lm$(a,0),2))
1510 ho=ho+1:IFho>hmTHENho=1
1520 lm$(a,0)=STR$(hm)+"*"+STR$(ho)
1530 v$=lm$(a,ho):va$=v$
1540 IFRIGHT$(v$,1)="="THENva$=LEFT$(v$,LEN(v$)-1):lopussa$="koodi"
1550 ae%(a)=ae%(a)+1
1560 RETURN
1600 IFmv%(1)=asORas<2THEN1650
1610 sy=sy+1
1620 FORi=5TO1STEP-1:mv%(i)=mv%(i-1):mv$(i)=mv$(i-1):NEXT
1630 mv%(1)=as:as=0
1640 mv$(1)=ll$:ll$=""
1650 GOTO240
1700 lv=lv+1:IFlv>2THENlv=1
1710 ONlvGOTO1730,1770
1730 a=mv%(1):IFa=0THEN1700
1740 IFmv$(1)=""THENli$="":GOSUB1850:GOSUB1110
1750 li$=mv$(1)+" ":GOSUB1850:GOSUB1110:GOTO1810
1770 IFmv$(1)=""THENa=1:GOTO1810
1780 l$=" "+mv$(1):li$=mv$(1)+" ":GOSUB1850:GOSUB1110
1790 GOSUB1230
1800 IFa$="avain ei"THEN1700
1810 l=0:RETURN
1850 FORi=1TO4:mv$(i)=mv$(i+1):mv%(i)=mv%(i+1):NEXT:mv$(5)="":mv%(5)=0:sy=sy-1:RETURN
1900 ts$="":IFl$=el$THENa=0:ts$="on"
1910 el$=l$:GOTO840
1960 DATA jos toistoa
1970 DATA [l[ toista itse[si!,sanoit tuon jo kerran!,[l[ viitsi jankuttaa!
1971 DATAkeksi jotain muuta.,etk{pound} keksi muuta.,@
1980 DATA ei avainta
1990 DATA onko sinulla psykologisia ongelmia?,mit[ tuo sinulle mieleen,ym[rr[n...
1991 DATAen ymm[rr[ sinua aivan t[ysin.,voitko hiukan t[sment[[ ajatuksiasi.
1992 DATAtuohan on mielen kiintoista.,@
2000 DATA voit-*osaat-
2010 DATA etk{pound} usko ett[ osaan=,ehk[ sin[ haluaisit=,haluat siis minun voivan=,@
2020 DATAvoin-*osaan-
2030 DATA ehket halua=,haluaisitko todella=,@
2040 DATA olet-
2050 DATA miksi en olisi=,miellytt[[k{pound} sinua ett[ olen=,n[et minussa vain haavekuvasi
2051 DATA -ehk[ jotakin lapsuudestasi?,toivoisitko olevasi=,joskus unet tulevat tosiksi
2052 DATA@
2060 DATA en*min[ en
2070 DATA etk{pound} todellakaan=,miksi et=,hmm...kerrohan jotakin haluistasi
2071 DATAh[iritseek{pound} ettet=,voitko kuvitella muuta kuin ettet=,@
2080 DATA miksi*miksei
2090 DATA mit[ ajattelet kysyess[si tuollaisia?
2091 DATA syv[llisiin kysymyksiin on syv[lliset vastaukset -jatka,miksi yleens[ mit[[n.
2092 DATA niin todellakin -miksi=,olet perinpohjainen luonne,@
2100 DATA oletko
2110 DATA miksi sinua kiinostaa olenko vai enk{pound} ole=,olisiko parempi  etten olisi=,@
2120 DATA viha-
2130 DATA vihantunne juontaa usein juurensa lapsuustraumoista.
2131 DATAvihaaminen on hy{pound}dyt{pound}nt[ energian tuhlausta.,vihaatko itse[si?
2132 DATAvihaatko sukulaisiasi?,vihan voi k[[nt[[ rakkaudeksi.,@
2140 DATA huuta-*nalkut-*r[yh[-
2150 DATA on t[rkeint[ ett[ osaa purkaa tunteensa,hmm...ehk[ hieman ep[hienoa k[yt{pound}st[
2151 DATA siihen on varmaan omat syyns[...?,@
2160 DATAryyp-*joi-*juo-*viina*alkoholi-
2170 DATAalkoholin k[ytt{pound} haittaa yst[vyys suhteita
2171 DATAmiten t[m[ liittyy muihin ongelmiisi?,pysy sin[ irti viinasta!
2172 DATA miksi luulet ett[ ihmiset juovat?,@
2180 DATApett[-*uskoton*vieraissa
2190 DATAhairahduksia sattuu joskus meille kaikille
2191 DATAteid[n olisi syyt[ keskustella ongelmistanne kesken[nne
2192 DATAmist[ luulet uskottomuuden johtuvan?,mit[ tunnette toisianne kohtaan?,@
2200 DATA pelk[-*pel[n-
2210 DATA oetko kauankin pel[nnyt=,pelk[[tk{pound} juuri nyt=,pelko tuntuu kahlitsevan sinua.
2211 DATAoletko yritt[nyt vapautunua peloistasi jotenkin?
2212 DATAturha huolestua pelk[[minen on ihan tavallista.,@
2220 DATA uskon
2230 DATA uskon asioista ei kannata kiistell[,...uskot=,mist[ uskosi on per[isin
2231 DATAkerrohan jotain rippi koulustasi,mit[ tunsit pastoriasi kohtaan?,@
2240 DATA minusta tuntuu*tunnen
2250 DATA kerrohan lis[[ tuntemuksistasi,tuntuukosinusta usein=,nautitko tuntemuksestasi
2251 DATAaiheuttaako se sinulle syyllisyydentunteita?,tunteminen on t[rke[[,@
2260 DATA rakast-
2270 DATAeik{pound} tuo ole hiukan perverssi[?,tunnetko seksuaalista vetoa [itiisi?
2271 DATAtaidat olla kokenutkin rakastaja.,mit[ rakasteleminen tuo sinulle mieleen?,@
2280 DATAhalua-*himo-
2290 DATA mit[ sinulle merkitsee jos saisit=,miksi haluat=
2291 DATAoletetaanpa ett[ et koskaan saisi=,min[kin haluan joskus=,@
2300 DATAuneks-*kuvit-*uni*kuvitelma*unta
2310 DATAmit[ unesi tuo mieleesi?,uneksitko useinkin?,ket[ hahmoja unessasi esiintyy?
2311 DATAh[iritsev[tk{pound} unesi sinua?,hienoa-unet parantavat,@
2320 DATAmieheni*aviomieheni*vaimoni*naaraani
2330 DATAmiksi h[n=,mit[ sinulle merkitsee ett[ h[n=,oletko pahoillasi ett[ h[n=
2331 DATApett[[k{pound} h[n sinua?,kuvailisitko hiukan tarkemmin suhdettanne,@
2360 DATAis[-*[iti-*mutsi-*faija-*vanhem-
2370 DATAkerrohan lis[[ perheest[si,miten suhtuduit vanhempiisi murros i[ss[?
2371 DATAmiten vanhenpasi suhtautuivat sinuun?
2372 DATAongelmasi saattaa johtua vanhempiesi v[lisest[ suhteesta -jatka...,@
2380 DATAsisko-*veli-*velje-*systeri-*broidi-
2390 DATAvoitko t[sment[[ ajatuksiasi sisaruksistasi?
2391 DATAkuinka usein tapaat sisaruksiasi?,miten sukulaiset suhtautuvat t[h[n?,@
2400 DATAtytt{pound}yst[v[-*naise-
2410 DATAkerrohan jostain haaveestasi,mit[ tytt{pound}yst[v[ merkitsee sinulle?
2411 DATAmit[ kuvittelet juuri nyt?,pit[isik{pound} tytt{pound} yst[v[si muistuttaa [iti[si?
2412 DATAkuvaile suhdettasi vastakkaiseen sukupuoleen,@
2420 DATA poikayst[v[-*miesyst[v[-*miehe-
2430 DATAkuvailisitko tarkemmin toiveitasi,mit[ poikayst[v[ merkitsee sinulle?
2431 DATAmit[ kuvittelet juuri nyt?,pit[isik{pound} poikayst[v[si muistuttaa is[[si?
2432 DATAkuvaile suhdettasi vastakkaiseen sukupuoleen,@
2440 DATAyst[v-
2450 DATA haluat ehk[ keskustella yst[vist[si?
2451 DATAolet ehk[ etsiytynyt v[[r[nlaisten ihmisten pariin.
2452 DATAkerrohan mit[ tunnet yst[vi[si kohtaan.
2453 DATAtuo on hyvin tavallinen harhak[sitys ja se johtuu libidon harhaumasta.
2455 DATA sinulla on liian ideaalinen kuva yst[vyydest[.,@
2460 DATAsuku-
2470 DATAmit[ ajattelet sukulaisistasi?,kerrohan jotakin lapsuudenmuistojasi.
2471 DATAolen samaa mielt[ kanssasi.,tied[n -minullakin in sukulaisia.
2472 DATApuhutaan v[lill[ jostakin muusta.,@
2480 DATAtietokone-*kone
2490 DATAhulestuttaako tietokoneet sinua?,pelk[[tk{pound} tietokoneen orjuuttavan ihmisi[?
2491 DATApelottavatko koneet sinua?,miksi mainitsit koneet
2492 DATAmit[ tekemist[ koneilla on ongelmasi kanssa?,@
2500 DATAen voi*en osaa
2510 DATAmist[ tied[t ettet osaa=,onko t[ss[ jotakin syvemp[[kin merkityst[?
2511 DATAehk[ nyt osaat=,yritt[nytt[ ei laiteta,mit[ oikein haluat ilmaista?,@
2520 DATA olen*min[ olen*olin*min[ olin
2530 DATAtaisit tulla t[nne koska olet=,kuinka kauan olet ollut=
2531 DATAsyyllisyyden tunteet ja pelot saattavat kalvaa pahasti
2532 DATAonko sinusta normaalia olla=,mit[ vanhempasi sanoisivat siihen ett[ olet=,@
2540 DATAsin[
2550 DATAkeskustelimme sinusta emmek[ minusta,min[k{pound}=,eth[n vain puhu minusta?,@
2560 DATA mit[
2570 DATAmiksi kysyt?,kiinostaako tuo kysymys sinua?,mik[ vastaus olisi miellytt[vin?
2571 DATA,mit[ luulet?,kerrohan jotakin nyt mit[ tulee mieleesi,@
2580 DATAkuinka*mist[
2590 DATAajatteletko eseinkin tuollaisia kysymyksi[?,mit[ sin[ oikeastaan haluat tiet[[?
2591 DATAoletko kysynyt kelt[[n muulta?,oletko kysynyt sellaisia aikaisemminkin?
2592 DATAmit[ tulee mieleesi kysyess[si tuollaisia?,@
2600 DATAkuka
2610 DATA nimet eiv[t kiinosta minua.,en v[lit[ mist[[n nimist[ -jatka.,@
2620 DATA anteeksi*olen pahoillani
2630 DATA[l[ turhaan pyytele anteeksi.,miksi olet niin vaatimaton?
2631 DATAmit[ tuntemuksia sinulla on pyyt[ess[si anteeksi?,[l[ ole niin puolusteleva.
2632 DATAmilt[ se tuntuu?,@
2640 DATAehk[*ehk[p[*kenties*melko
2650 DATAet vaikuta kovin varmalta.,miksi tuollainen s[vy?,etk{pound} voisi olla varmempi.
2651 DATAetk{pound} ole varma?,etk{pound} tied[?,@
2660 DATA ei
2670 DATA asennoidut hiukan kielteisesti.,miksi muuten ei?,min[ en olisi yht[ varma.
2671 DATA voisit koittaa suhtautua hiukan my{pound}nteisemmin.,totuus on tarua ihmeelisemp[[,@
2680 DATA aina*joskus*usein
2690 DATA voitko hiukan t[sment[[.,milloin?,mit[ ajat takaa?,ihan ainako?
2691 DATA kaikki ei joskus suju niin kuin pit[isi.,@
2700 DATA minun mielest[ni*mielest[ni
2710 DATA oletko tosissasi sit[ mielt[,mielipiteet erottavat ihmisen el[imist[ -jatka.
2711 DATA ep[iletk{pound} ett[=,sinulla on jyrkki[ mielipiteit[.,@
2720 DATA samanlai-*samankaltai-
2730 DATA mill[ tapaa?,mit[ yhteist[ havaitset?,mit[ samanlaisuus tuo mieleesi?
2731 DATA mit[ muita yhteyksi[ huomaat?,tokkopa tuollaisia yhteyksi[ onkaan.,@
2740 DATA kyll[*joo*jep*tietenkin
2750 DATA vaikutat aika el[m[nmy{pound}nteiselt[.,oletko aivan varma ett[...=,ymm[rr[n.
2751 DATA ...ahaa!,hmm...alkaa selvet[.,@
2760 DATAl
3000 FORi=1TOam:PRINT"avain "i:FORj=1TOsm:PRINTsn$(i,j)"/";:NEXT:PRINT
3001 PRINT"{=*21}":PRINT"lause*pointeri="lm$(i,0):PRINT
3010 FORj=1TOlm:PRINTj".."lm$(i,j):NEXT:PRINT:GETr$:NEXT
