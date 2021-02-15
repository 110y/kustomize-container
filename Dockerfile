FROM alpine:3.13.1 AS builder
ARG VERSION

WORKDIR /usr/local/src/
RUN wget -O kustomize.tar "https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${VERSION}/kustomize_v${VERSION}_linux_amd64.tar.gz" && \
            tar xvzf kustomize.tar && chmod +x ./kustomize

FROM scratch

COPY --from=builder /usr/local/src/kustomize /kustomize
ENTRYPOINT ["/kustomize"]
