FROM golang:1.12.6-alpine3.10 AS builder

ENV GO111MODULE on

RUN apk --no-cache add gcc=8.3.0-r0 musl-dev=1.1.22-r2 git=2.22.0-r0

COPY ./kustomize /usr/local/src/kustomize

WORKDIR /usr/local/src/kustomize
RUN go build -o /usr/bin/kustomize ./cmd/kustomize

FROM alpine:3.10

COPY --from=builder /usr/bin/kustomize /usr/bin/kustomize
