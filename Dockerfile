FROM golang:alpine as builder

WORKDIR /go/src
COPY . .
RUN go build -o /app hello.go

FROM hello-world:latest
COPY --from=builder /app /app
CMD ["/app"]