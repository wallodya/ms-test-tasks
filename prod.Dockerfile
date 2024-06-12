FROM golang:1.22 AS build-stage
WORKDIR /code
COPY go.mod go.sum ./
RUN go mod download
COPY *.go ./
RUN CGO_ENABLED=0 GOOS=linux go build -o /ms-tasks


FROM build-stage AS run-test-stage
RUN go test -v ./...


FROM gcr.io/distroless/base-debian11 AS build-release-stage
WORKDIR /
COPY --from=build-stage /ms-tasks /ms-tasks
EXPOSE 8888
USER nonroot:nonroot
ENTRYPOINT [ "/ms-tasks" ]
