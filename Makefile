VERSION := 3.5.4

.PHONY: container
container:
	docker build --build-arg VERSION=${VERSION} --tag 110y/kustomize:${VERSION} .

.PHONY: registry
registry: container
	docker push 110y/kustomize:${VERSION}
