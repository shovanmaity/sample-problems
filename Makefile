EXTERNAL_TOOLS=\
	github.com/golang/dep/cmd/dep \
	gopkg.in/alecthomas/gometalinter.v1\
	github.com/mvdan/interfacer\
	github.com/GoASTScanner/gas\
	github.com/mvdan/unparam\

test: 	vet fmt
	go test -v ./...

vet:
	go list ./... | xargs go vet

fmt:
	find . -type f -name "*.go" | xargs gofmt -s -w -l

golint:
	@gometalinter.v1 --install
	@gometalinter.v1 --vendor --deadline=600s ./...

bootstrap:
	@for tool in  $(EXTERNAL_TOOLS) ; do \
		echo "Installing $$tool" ; \
		go get -u $$tool; \
	done

.PHONY: test
