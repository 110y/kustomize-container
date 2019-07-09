FROM alpine:3.10 AS builder
ARG VERSION

WORKDIR /usr/local/src/
RUN wget -O kustomize  "https://github.com/kubernetes-sigs/kustomize/releases/download/v${VERSION}/kustomize_${VERSION}_linux_amd64"
RUN chmod +x ./kustomize

FROM scratch

COPY --from=builder /usr/local/src/kustomize /kustomize
ENTRYPOINT ["/kustomize"]
