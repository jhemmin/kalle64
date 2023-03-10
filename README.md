# Kalle64

Back to BASIC. Finnish chatbot from 80's. Shake ChatGPT!

> It is practically impossible to teach good programming to students that have had a prior exposure to BASIC: as potential programmers they are mentally mutilated beyond hope of regeneration. (Edsger W. Dijkstra)

## Background

"Kalle Kotipsykiatri" ("Kalle, the home psychiatrist") is a Finnish chatbot.
Original version was written by Pekka Tolonen for the Apple II home computer
(Prosessori 8-9/1982). It was ported to the Commodore 64 by late
[Jyrki J. Kasvi](https://fi.wikipedia.org/wiki/Jyrki_Kasvi),
and published in MikroBitti 1/1984 (and several errata after that).

Further information:
- Saarikoski, P., Reunanen, M., & Suominen, J. (2019). ”Leiki pöpiä – Kalle parantaa”: Kalle kotipsykiatri -tietokoneohjelma tekoälyn popularisoijana 1980-luvulla. Tekniikan Waiheita, 37(3), 6–30. [article](https://doi.org/10.33355/tw.86772)
- [Wikipedia](https://fi.wikipedia.org/wiki/Kalle_Kotipsykiatri)
- [Short introduction in English](https://en-academic.com/dic.nsf/enwiki/8479595)

## Tools

One option would have been to use [VICE](https://vice-emu.sourceforge.io/)
but I was more interested about the original source code.
So [bastext](https://github.com/nafmo/bastext) is used for converting
Commodore BASIC files to readable text.
And [cbmbasic](https://github.com/mist64/cbmbasic) will run BASIC programs.

## Development environment

```bash
DOCKER_BUILDKIT docker build -t kalle64 .
docker run -it --rm -v $(pwd)/src:/home/src -u $(id -u):$(id -g) kalle64 sh
```

## Original source code

Note that download location is not available anymore.

```bash
./download.sh
./bastext -it src/KALLEKOT.T64 > src/kalle.bas
```

Tape archive contains two different versions so text editor was used to
separate them to files `kalle-v1.bas` and `kalle-v2.bas`.

## Meet your shrink

```bash
./cbmbasic src/kalle-v1.bas
```

Turn CAPS LOCK ON (no Ä or Ö available so use AO in version 1 and [] in
version 2, and type "LOPPU" to end the conversation).

```
TERVE,OLEN KALLE JA KUTISTAN KALLOSI JA LUOTAAN TAJUNTASI TASOJA.

NO NIIN - RENTOUDUHAN NIIN ALOITAMME ISTUNNON.
JOS KUITENKIN ENSIKSI ANTAISIT NIMESI TANNE REKISTERIIN.
? JARMO


HIENOA JARMO , KERROHAN NYT MINULLE MIKA ON ONGELMASI

 ?
```

Greetings to Mika H!
