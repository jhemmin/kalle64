# Kalle64

Back to BASIC. Finnish chatbot from 80's.

## Tools

`bastext` is for converting Commodore BASIC files to readable text.
`cbmbasic` will run BASIC programs.

```bash
DOCKER_BUILDKIT docker build -t kalle64 .
docker run -it --rm -v $(pwd)/src:/home/src -u $(id -u):$(id -g) kalle64 sh
```

## Source file

From container. Note that download script does not work anymore.

```bash
./download.sh
./bastext -it src/KALLEKOT.T64 > src/kalle.bas
```

Tape archive contains two version so text editor was used to separate them
to files `kalle-v1.bas` and `kalle-v2.bas`.
