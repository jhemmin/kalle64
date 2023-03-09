# kalle64

Back to BASIC. Finnish chatbot from 80's.

## Tools

`bastext` is for converting Commodore BASIC files to readable text.
`cbmbasic` will run BASIC programs.

```bash
DOCKER_BUILDKIT docker build -t kalle64 .
docker run -it --rm -v $(pwd)/src:/home/src -u $(id -u):$(id -g) kalle64 sh
```

