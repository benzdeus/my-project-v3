FROM golang:latest

WORKDIR /app

COPY go.mod ./
COPY go.sum ./

RUN go mod download

COPY . ./

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o myapp ./cmd/main.go

FROM scratch

COPY --from=0 /app/myapp .

EXPOSE 1323

ENV TZ=Asia/Bangkok

ENTRYPOINT ["/myapp"]
