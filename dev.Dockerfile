FROM golang:1.22

ENV PROJECT_DIR=/code
ENV GO111MODULE=on
ENV CGO_ENABLED=0

WORKDIR /code
RUN mkdir "/build"
COPY . .

RUN go get github.com/githubnemo/CompileDaemon
RUN go install github.com/githubnemo/CompileDaemon

ENTRYPOINT CompileDaemon -build="go build -o /build/app" -command="/build/app"
