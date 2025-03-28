DOCKER := $(shell which docker)
DOCKER_BUF := $(DOCKER) run --rm -v $(CURDIR):/workspace --workdir /workspace bufbuild/buf
HTTPS_GIT := https://github.com/your-org/ampd-proto.git

.PHONY: all
all: proto-format proto-lint

.PHONY: prereqs
prereqs:
	@which protoc &>/dev/null || echo "Please install protoc for grpc (https://grpc.io/docs/languages/go/quickstart/)"

# Format the proto files
.PHONY: proto-format
proto-format:
	@echo "Formatting Protobuf files"
	@$(DOCKER) run --rm -v $(CURDIR):/workspace \
	--workdir /workspace tendermintdev/docker-build-proto \
	$( find ./ -name "*.proto" -exec clang-format -i {} \; )

# Lint the proto files
.PHONY: proto-lint
proto-lint:
	@echo "Linting Protobuf files"
	@$(DOCKER_BUF) lint
