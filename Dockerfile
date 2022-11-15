FROM golang:1.19 as builder

WORKDIR /app
COPY . /app
RUN CGO_ENABLED=0 GOOS=linux go build -o api main.go
# final (target) stage

FROM scratch
WORKDIR /app
COPY --from=builder /app/api ./
ENV HOST=localhost DBPORT=5432
ENV USER=root PASSWORD=root DBNAME=root
ENV GIN_MODE=release
EXPOSE 8080
CMD ["./api"]
