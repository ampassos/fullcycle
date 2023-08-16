 
FROM golang:1.12-alpine AS b

WORKDIR /app

COPY ./main.go .

RUN go build -ldflags '-s -w' main.go

FROM scratch

WORKDIR /app

COPY --from=b /app / 

CMD ["/main"]