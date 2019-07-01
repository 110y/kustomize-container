KUSTOMIZE_VERSION := v2.1.0

.PHONY: container
container:
	docker build --tag 110y/kustomize:${KUSTOMIZE_VERSION} .

.PHONY: registry
registry: container
	docker push 110y/kustomize:${KUSTOMIZE_VERSION}
