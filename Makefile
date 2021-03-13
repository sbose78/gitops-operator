E2E_TEST_DIR=test/e2e

default: test

.PHONY: test
test:
	go test `go list ./... | grep -v ${E2E_TEST_DIR}`

.PHONY: prepare-test-cluster
prepare-test-cluster:
	. ./scripts/prepare-test-cluster.sh

.PHONY: test-e2e
test-e2e:
	. ./scripts/run_e2e_tests.sh

.PHONY: test-e2e-on-installed-operator
test-e2e-on-installed-operator:
	. ./scripts/run_e2e_tests_on_installed_operator.sh

.PHONY: gomod_tidy
gomod_tidy:
	go mod tidy

.PHONY: gofmt
gofmt:
	go fmt -x ./...

.PHONY: run-local
run-local:
	operator-sdk run --local --watch-namespace ""
