170 GOTO380
190 GOTO320
200 IFL$=" LOPPU "THEN270
220 GOSUB830
230 GOTO1600
240 GOTO760
260 GOSUB640
270 GOTO640
280 END
320 PRINT"{BLUE}":INPUTVCK$:IFVCK$=""THEN320
321 L$=VCK$
330 L$=" "+L$+" ":GOTO200
380 KS=17:KP=2:AM=40:LM=6:SM=6
385 PRINT"{CLEAR}{DOWN*9}{RIGHT*6}HETKI{.*3}"
390 DEFFNS(S)=INT(RND(1)*S)+1
400 DIMKS$(KS,1),KP$(KP,1),MV$(5),MV%(5),LI$(30),SN$(AM,SM),LM$(AM,LM),AE%(AM)
420 FORI=1TOKS:READKS$(I,0),KS$(I,1):NEXT
430 DATAMIN[,SIN[,SIN[,MIN[,ME,TE,MINUN,SINUN,SINUN,MINUN,MEID[N,TEID[N,SINUT,MINUT
431 DATAMEID[T,TEID[T,SINUA,MINUA,MINUA,SINUA,OLEN,OLET,OLET,OLEN,MINULLE,SINULLE
440 DATASINULLE,MINULLE,MINUT,SINUT,TEID[T,MEID[T,OLEMME,OLETTE
460 FORI=1TOKP:READKP$(I,0),KP$(I,1):NEXT
470 DATAMI,SI,SI,NI
490 FORI=0TOAM:READAS$:IFAS$="L"THENAM=I-1:GOTO560
500 GOSUB1360
510 FORJ=1TOLM+1:READL$:IFL$="@"THENLM$(I,0)=STR$(J-1)+"*"+STR$(FNS(J)-1):GOTO540
520 LM$(I,J)=L$
530 NEXTJ
540 NEXTI:RESTORE
560 REM
580 PRINT"NO NIIN, RENTOUDUHAN NIIN ALOITAMME ISTUNNON. JOS KUITENKIN ANTAISIT";
581 PRINT" NIMESI T[NNE REKISTERIIN":INPUTN$
582 PRINT"{DOWN}HIENOA "N$", KERROHAN NYT MIK[ ON ONGELMASI"
583 PRINT:GOTO190
640 K=0
650 PRINT"{CLEAR}K E S K U S T E L U N{SPACE*7}A I H E E T":PRINT
655 REM
660 FORI=0TO19:IFI+K>AMTHEN720
670 PRINTI+K"..";LEFT$(SN$(I+K,1),10);
690 FORJ=0TOAE%(I+K):PRINT"+";:NEXT
700 PRINTAE%(I+K)
710 NEXT:PRINT:PRINT"JATKA{.*3}";:K=I
715 GETA$:IFA$<>""THEN650
717 GOTO715
720 PRINT"KIITOS KESKUSTELUSTA JA HYV[[ JATKOA":END
760 IFNOT(LOPUSSA$="KOODI")THENLI$=""
770 REM
771 PRINT"-";VA$;LI$
780 VA$="":LI$="":GOTO190
830 GOTO1900
840 IFTS$="ON"THEN870
850 GOSUB1230
860 IFA$="AVAIN EI"THENGOSUB1700:GOSUB1490:GOTO890
870 GOSUB1490
880 GOSUB930
890 RETURN
930 GOSUB1060
940 IFLI$=" "THEN970
950 LL$=LEFT$(LI$,LEN(LI$)-1):GOSUB1110
970 RETURN
990 FORI=1TOB
1000 FORJ=1TOKS:IFLI$(I)=KS$(J,0)THENLI$(I)=KS$(J,1):GOTO1020
1010 NEXTJ
1020 FORK=1TOKP
1021 S$=KP$(K,0)
1022 IFRIGHT$(LI$(I),LEN(S$))=S$THENVCR=1
1023 IFVCR=1THENLI$(I)=LEFT$(LI$(I),LEN(LI$(I))-LEN(S$))+KP$(K,1):VCR=0:GOTO1040
1030 NEXTK
1040 NEXTI:RETURN
1050 LI$="":FORI=1TOB:LI$=LI$+" "+LI$(I):NEXT:RETURN
1060 LL$="":LI$=RIGHT$(L$,LEN(L$)-L)+" "
1070 FORI=1TOLEN(LI$):IFMID$(LI$,I,1)=" "THENLI$=RIGHT$(LI$,LEN(LI$)-I):GOTO1090
1080 NEXT
1090 RETURN
1110 GOSUB1160
1120 GOSUB990
1130 GOSUB1050
1140 RETURN
1160 IFLI$=""THENLI$=" "
1161 A$=LEFT$(LI$,LEN(LI$)-1):B=0
1170 FORI=1TO10:LI$(I)="":NEXT
1180 B=B+1:FORI=1TOLEN(A$)
1181 IFMID$(A$,I,1)=" "THENLI$(B)=LEFT$(A$,I-1):VCC=1
1182 IFVCC=1THENA$=MID$(A$,I+1,LEN(A$)-LEN(LI$(B))-1):VCC=0:GOTO1180
1190 NEXT:RETURN
1230 A$="AVAIN EI"
1250 FORI=2TOAM
1270 FORJ=1TOVAL(SN$(I,0))
1290 FORL=1TOLEN(L$)-LEN(SN$(I,J))+1
1300 IFSN$(I,J)=MID$(L$,L,LEN(SN$(I,J)))THENAS$=SN$(I,J):A$="AVAIN ON":A=I:AS=A:GOTO1320
1310 NEXTL,J,I
1320 RETURN
1360 A$=" "+AS$+"*":A=0
1370 A=A+1:FORL=1TOLEN(A$)
1371 IFMID$(A$,L,1)="*"THENSN$(I,A)=LEFT$(A$,L-1):VVC=1
1372 IFVVC=1THENA$=MID$(A$,L+1,LEN(A$)-LEN(SN$(I,A))-1):VVC=0:GOTO1370
1380 NEXT
1400 FORL=1TOA
1401 IFRIGHT$(SN$(I,L),1)="-"THENSN$(I,L)=LEFT$(SN$(I,L),LEN(SN$(I,L))-1):GOTO1420
1410 SN$(I,L)=SN$(I,L)+" "
1420 SN$(I,L)=" "+SN$(I,L)
1430 NEXT
1440 SN$(I,1)=RIGHT$(SN$(I,1),LEN(SN$(I,1))-1)
1450 SN$(I,0)=STR$(A-1):RETURN
1490 LOPUSSA$=""
1500 HO=VAL(RIGHT$(LM$(A,0),1)):HM=VAL(LEFT$(LM$(A,0),2))
1510 HO=HO+1:IFHO>HMTHENHO=1
1520 LM$(A,0)=STR$(HM)+"*"+STR$(HO)
1530 V$=LM$(A,HO):VA$=V$
1540 IFRIGHT$(V$,1)="="THENVA$=LEFT$(V$,LEN(V$)-1):LOPUSSA$="KOODI"
1550 AE%(A)=AE%(A)+1
1560 RETURN
1600 IFMV%(1)=ASORAS<2THEN1650
1610 SY=SY+1
1620 FORI=5TO1STEP-1:MV%(I)=MV%(I-1):MV$(I)=MV$(I-1):NEXT
1630 MV%(1)=AS:AS=0
1640 MV$(1)=LL$:LL$=""
1650 GOTO240
1700 LV=LV+1:IFLV>2THENLV=1
1710 ONLVGOTO1730,1770
1730 A=MV%(1):IFA=0THEN1700
1740 IFMV$(1)=""THENLI$="":GOSUB1850:GOSUB1110
1750 LI$=MV$(1)+" ":GOSUB1850:GOSUB1110:GOTO1810
1770 IFMV$(1)=""THENA=1:GOTO1810
1780 L$=" "+MV$(1):LI$=MV$(1)+" ":GOSUB1850:GOSUB1110
1790 GOSUB1230
1800 IFA$="AVAIN EI"THEN1700
1810 L=0:RETURN
1850 FORI=1TO4:MV$(I)=MV$(I+1):MV%(I)=MV%(I+1):NEXT:MV$(5)="":MV%(5)=0:SY=SY-1:RETURN
1900 TS$="":IFL$=EL$THENA=0:TS$="ON"
1910 EL$=L$:GOTO840
1960 DATA JOS TOISTOA
1970 DATA [L[ TOISTA ITSE[SI!,SANOIT TUON JO KERRAN!,[L[ VIITSI JANKUTTAA!
1971 DATAKEKSI JOTAIN MUUTA.,ETK{POUND} KEKSI MUUTA.,@
1980 DATA EI AVAINTA
1990 DATA ONKO SINULLA PSYKOLOGISIA ONGELMIA?,MIT[ TUO SINULLE MIELEEN,YM[RR[N...
1991 DATAEN YMM[RR[ SINUA AIVAN T[YSIN.,VOITKO HIUKAN T[SMENT[[ AJATUKSIASI.
1992 DATATUOHAN ON MIELEN KIINTOISTA.,@
2000 DATA VOIT-*OSAAT-
2010 DATA ETK{POUND} USKO ETT[ OSAAN=,EHK[ SIN[ HALUAISIT=,HALUAT SIIS MINUN VOIVAN=,@
2020 DATAVOIN-*OSAAN-
2030 DATA EHKET HALUA=,HALUAISITKO TODELLA=,@
2040 DATA OLET-
2050 DATA MIKSI EN OLISI=,MIELLYTT[[K{POUND} SINUA ETT[ OLEN=,N[ET MINUSSA VAIN HAAVEKUVASI
2051 DATA -EHK[ JOTAKIN LAPSUUDESTASI?,TOIVOISITKO OLEVASI=,JOSKUS UNET TULEVAT TOSIKSI
2052 DATA@
2060 DATA EN*MIN[ EN
2070 DATA ETK{POUND} TODELLAKAAN=,MIKSI ET=,HMM...KERROHAN JOTAKIN HALUISTASI
2071 DATAH[IRITSEEK{POUND} ETTET=,VOITKO KUVITELLA MUUTA KUIN ETTET=,@
2080 DATA MIKSI*MIKSEI
2090 DATA MIT[ AJATTELET KYSYESS[SI TUOLLAISIA?
2091 DATA SYV[LLISIIN KYSYMYKSIIN ON SYV[LLISET VASTAUKSET -JATKA,MIKSI YLEENS[ MIT[[N.
2092 DATA NIIN TODELLAKIN -MIKSI=,OLET PERINPOHJAINEN LUONNE,@
2100 DATA OLETKO
2110 DATA MIKSI SINUA KIINOSTAA OLENKO VAI ENK{POUND} OLE=,OLISIKO PAREMPI  ETTEN OLISI=,@
2120 DATA VIHA-
2130 DATA VIHANTUNNE JUONTAA USEIN JUURENSA LAPSUUSTRAUMOISTA.
2131 DATAVIHAAMINEN ON HY{POUND}DYT{POUND}NT[ ENERGIAN TUHLAUSTA.,VIHAATKO ITSE[SI?
2132 DATAVIHAATKO SUKULAISIASI?,VIHAN VOI K[[NT[[ RAKKAUDEKSI.,@
2140 DATA HUUTA-*NALKUT-*R[YH[-
2150 DATA ON T[RKEINT[ ETT[ OSAA PURKAA TUNTEENSA,HMM...EHK[ HIEMAN EP[HIENOA K[YT{POUND}ST[
2151 DATA SIIHEN ON VARMAAN OMAT SYYNS[...?,@
2160 DATARYYP-*JOI-*JUO-*VIINA*ALKOHOLI-
2170 DATAALKOHOLIN K[YTT{POUND} HAITTAA YST[VYYS SUHTEITA
2171 DATAMITEN T[M[ LIITTYY MUIHIN ONGELMIISI?,PYSY SIN[ IRTI VIINASTA!
2172 DATA MIKSI LUULET ETT[ IHMISET JUOVAT?,@
2180 DATAPETT[-*USKOTON*VIERAISSA
2190 DATAHAIRAHDUKSIA SATTUU JOSKUS MEILLE KAIKILLE
2191 DATATEID[N OLISI SYYT[ KESKUSTELLA ONGELMISTANNE KESKEN[NNE
2192 DATAMIST[ LUULET USKOTTOMUUDEN JOHTUVAN?,MIT[ TUNNETTE TOISIANNE KOHTAAN?,@
2200 DATA PELK[-*PEL[N-
2210 DATA OETKO KAUANKIN PEL[NNYT=,PELK[[TK{POUND} JUURI NYT=,PELKO TUNTUU KAHLITSEVAN SINUA.
2211 DATAOLETKO YRITT[NYT VAPAUTUNUA PELOISTASI JOTENKIN?
2212 DATATURHA HUOLESTUA PELK[[MINEN ON IHAN TAVALLISTA.,@
2220 DATA USKON
2230 DATA USKON ASIOISTA EI KANNATA KIISTELL[,...USKOT=,MIST[ USKOSI ON PER[ISIN
2231 DATAKERROHAN JOTAIN RIPPI KOULUSTASI,MIT[ TUNSIT PASTORIASI KOHTAAN?,@
2240 DATA MINUSTA TUNTUU*TUNNEN
2250 DATA KERROHAN LIS[[ TUNTEMUKSISTASI,TUNTUUKOSINUSTA USEIN=,NAUTITKO TUNTEMUKSESTASI
2251 DATAAIHEUTTAAKO SE SINULLE SYYLLISYYDENTUNTEITA?,TUNTEMINEN ON T[RKE[[,@
2260 DATA RAKAST-
2270 DATAEIK{POUND} TUO OLE HIUKAN PERVERSSI[?,TUNNETKO SEKSUAALISTA VETOA [ITIISI?
2271 DATATAIDAT OLLA KOKENUTKIN RAKASTAJA.,MIT[ RAKASTELEMINEN TUO SINULLE MIELEEN?,@
2280 DATAHALUA-*HIMO-
2290 DATA MIT[ SINULLE MERKITSEE JOS SAISIT=,MIKSI HALUAT=
2291 DATAOLETETAANPA ETT[ ET KOSKAAN SAISI=,MIN[KIN HALUAN JOSKUS=,@
2300 DATAUNEKS-*KUVIT-*UNI*KUVITELMA*UNTA
2310 DATAMIT[ UNESI TUO MIELEESI?,UNEKSITKO USEINKIN?,KET[ HAHMOJA UNESSASI ESIINTYY?
2311 DATAH[IRITSEV[TK{POUND} UNESI SINUA?,HIENOA-UNET PARANTAVAT,@
2320 DATAMIEHENI*AVIOMIEHENI*VAIMONI*NAARAANI
2330 DATAMIKSI H[N=,MIT[ SINULLE MERKITSEE ETT[ H[N=,OLETKO PAHOILLASI ETT[ H[N=
2331 DATAPETT[[K{POUND} H[N SINUA?,KUVAILISITKO HIUKAN TARKEMMIN SUHDETTANNE,@
2360 DATAIS[-*[ITI-*MUTSI-*FAIJA-*VANHEM-
2370 DATAKERROHAN LIS[[ PERHEEST[SI,MITEN SUHTUDUIT VANHEMPIISI MURROS I[SS[?
2371 DATAMITEN VANHENPASI SUHTAUTUIVAT SINUUN?
2372 DATAONGELMASI SAATTAA JOHTUA VANHEMPIESI V[LISEST[ SUHTEESTA -JATKA...,@
2380 DATASISKO-*VELI-*VELJE-*SYSTERI-*BROIDI-
2390 DATAVOITKO T[SMENT[[ AJATUKSIASI SISARUKSISTASI?
2391 DATAKUINKA USEIN TAPAAT SISARUKSIASI?,MITEN SUKULAISET SUHTAUTUVAT T[H[N?,@
2400 DATATYTT{POUND}YST[V[-*NAISE-
2410 DATAKERROHAN JOSTAIN HAAVEESTASI,MIT[ TYTT{POUND}YST[V[ MERKITSEE SINULLE?
2411 DATAMIT[ KUVITTELET JUURI NYT?,PIT[ISIK{POUND} TYTT{POUND} YST[V[SI MUISTUTTAA [ITI[SI?
2412 DATAKUVAILE SUHDETTASI VASTAKKAISEEN SUKUPUOLEEN,@
2420 DATA POIKAYST[V[-*MIESYST[V[-*MIEHE-
2430 DATAKUVAILISITKO TARKEMMIN TOIVEITASI,MIT[ POIKAYST[V[ MERKITSEE SINULLE?
2431 DATAMIT[ KUVITTELET JUURI NYT?,PIT[ISIK{POUND} POIKAYST[V[SI MUISTUTTAA IS[[SI?
2432 DATAKUVAILE SUHDETTASI VASTAKKAISEEN SUKUPUOLEEN,@
2440 DATAYST[V-
2450 DATA HALUAT EHK[ KESKUSTELLA YST[VIST[SI?
2451 DATAOLET EHK[ ETSIYTYNYT V[[R[NLAISTEN IHMISTEN PARIIN.
2452 DATAKERROHAN MIT[ TUNNET YST[VI[SI KOHTAAN.
2453 DATATUO ON HYVIN TAVALLINEN HARHAK[SITYS JA SE JOHTUU LIBIDON HARHAUMASTA.
2455 DATA SINULLA ON LIIAN IDEAALINEN KUVA YST[VYYDEST[.,@
2460 DATASUKU-
2470 DATAMIT[ AJATTELET SUKULAISISTASI?,KERROHAN JOTAKIN LAPSUUDENMUISTOJASI.
2471 DATAOLEN SAMAA MIELT[ KANSSASI.,TIED[N -MINULLAKIN IN SUKULAISIA.
2472 DATAPUHUTAAN V[LILL[ JOSTAKIN MUUSTA.,@
2480 DATATIETOKONE-*KONE
2490 DATAHULESTUTTAAKO TIETOKONEET SINUA?,PELK[[TK{POUND} TIETOKONEEN ORJUUTTAVAN IHMISI[?
2491 DATAPELOTTAVATKO KONEET SINUA?,MIKSI MAINITSIT KONEET
2492 DATAMIT[ TEKEMIST[ KONEILLA ON ONGELMASI KANSSA?,@
2500 DATAEN VOI*EN OSAA
2510 DATAMIST[ TIED[T ETTET OSAA=,ONKO T[SS[ JOTAKIN SYVEMP[[KIN MERKITYST[?
2511 DATAEHK[ NYT OSAAT=,YRITT[NYTT[ EI LAITETA,MIT[ OIKEIN HALUAT ILMAISTA?,@
2520 DATA OLEN*MIN[ OLEN*OLIN*MIN[ OLIN
2530 DATATAISIT TULLA T[NNE KOSKA OLET=,KUINKA KAUAN OLET OLLUT=
2531 DATASYYLLISYYDEN TUNTEET JA PELOT SAATTAVAT KALVAA PAHASTI
2532 DATAONKO SINUSTA NORMAALIA OLLA=,MIT[ VANHEMPASI SANOISIVAT SIIHEN ETT[ OLET=,@
2540 DATASIN[
2550 DATAKESKUSTELIMME SINUSTA EMMEK[ MINUSTA,MIN[K{POUND}=,ETH[N VAIN PUHU MINUSTA?,@
2560 DATA MIT[
2570 DATAMIKSI KYSYT?,KIINOSTAAKO TUO KYSYMYS SINUA?,MIK[ VASTAUS OLISI MIELLYTT[VIN?
2571 DATA,MIT[ LUULET?,KERROHAN JOTAKIN NYT MIT[ TULEE MIELEESI,@
2580 DATAKUINKA*MIST[
2590 DATAAJATTELETKO ESEINKIN TUOLLAISIA KYSYMYKSI[?,MIT[ SIN[ OIKEASTAAN HALUAT TIET[[?
2591 DATAOLETKO KYSYNYT KELT[[N MUULTA?,OLETKO KYSYNYT SELLAISIA AIKAISEMMINKIN?
2592 DATAMIT[ TULEE MIELEESI KYSYESS[SI TUOLLAISIA?,@
2600 DATAKUKA
2610 DATA NIMET EIV[T KIINOSTA MINUA.,EN V[LIT[ MIST[[N NIMIST[ -JATKA.,@
2620 DATA ANTEEKSI*OLEN PAHOILLANI
2630 DATA[L[ TURHAAN PYYTELE ANTEEKSI.,MIKSI OLET NIIN VAATIMATON?
2631 DATAMIT[ TUNTEMUKSIA SINULLA ON PYYT[ESS[SI ANTEEKSI?,[L[ OLE NIIN PUOLUSTELEVA.
2632 DATAMILT[ SE TUNTUU?,@
2640 DATAEHK[*EHK[P[*KENTIES*MELKO
2650 DATAET VAIKUTA KOVIN VARMALTA.,MIKSI TUOLLAINEN S[VY?,ETK{POUND} VOISI OLLA VARMEMPI.
2651 DATAETK{POUND} OLE VARMA?,ETK{POUND} TIED[?,@
2660 DATA EI
2670 DATA ASENNOIDUT HIUKAN KIELTEISESTI.,MIKSI MUUTEN EI?,MIN[ EN OLISI YHT[ VARMA.
2671 DATA VOISIT KOITTAA SUHTAUTUA HIUKAN MY{POUND}NTEISEMMIN.,TOTUUS ON TARUA IHMEELISEMP[[,@
2680 DATA AINA*JOSKUS*USEIN
2690 DATA VOITKO HIUKAN T[SMENT[[.,MILLOIN?,MIT[ AJAT TAKAA?,IHAN AINAKO?
2691 DATA KAIKKI EI JOSKUS SUJU NIIN KUIN PIT[ISI.,@
2700 DATA MINUN MIELEST[NI*MIELEST[NI
2710 DATA OLETKO TOSISSASI SIT[ MIELT[,MIELIPITEET EROTTAVAT IHMISEN EL[IMIST[ -JATKA.
2711 DATA EP[ILETK{POUND} ETT[=,SINULLA ON JYRKKI[ MIELIPITEIT[.,@
2720 DATA SAMANLAI-*SAMANKALTAI-
2730 DATA MILL[ TAPAA?,MIT[ YHTEIST[ HAVAITSET?,MIT[ SAMANLAISUUS TUO MIELEESI?
2731 DATA MIT[ MUITA YHTEYKSI[ HUOMAAT?,TOKKOPA TUOLLAISIA YHTEYKSI[ ONKAAN.,@
2740 DATA KYLL[*JOO*JEP*TIETENKIN
2750 DATA VAIKUTAT AIKA EL[M[NMY{POUND}NTEISELT[.,OLETKO AIVAN VARMA ETT[...=,YMM[RR[N.
2751 DATA ...AHAA!,HMM...ALKAA SELVET[.,@
2760 DATAL
3000 FORI=1TOAM:PRINT"AVAIN "I:FORJ=1TOSM:PRINTSN$(I,J)"/";:NEXT:PRINT
3001 PRINT"{=*21}":PRINT"LAUSE*POINTERI="LM$(I,0):PRINT
3010 FORJ=1TOLM:PRINTJ".."LM$(I,J):NEXT:PRINT:GETR$:NEXT