FROM gcc AS builder
COPY bastext /home/bastext
WORKDIR /home/bastext
RUN make
COPY cbmbasic /home/cbmbasic
WORKDIR /home/cbmbasic
RUN make

FROM busybox:glibc
WORKDIR /home
COPY --from=builder /home/bastext/bastext ./
COPY --from=builder /home/cbmbasic/cbmbasic ./
