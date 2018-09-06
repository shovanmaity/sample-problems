test: 	vet fmt
	go test -v ./...

vet:
	go list ./... | xargs go vet

fmt:
	find . -type f -name "*.go" | xargs gofmt -s -w -l

.PHONY: test
