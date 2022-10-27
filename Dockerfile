FROM golang:alpine AS builder
WORKDIR /usr/src/app
COPY desafio.go .
RUN go build desafio.go && rm desafio.go

FROM scratch
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app .

ENTRYPOINT [ "./desafio" ]
