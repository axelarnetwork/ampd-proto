# Ampd Proto

## Overview
This repository contains Protocol Buffer (protobuf) definition files for the Ampd service, which connects to the Axelar blockchain network. These proto files define the gRPC interface that clients use to interact with Ampd.

## Contents
- `ampd.proto`: Contains service and message definitions for the Blockchain and Crypto services

## Proto File Structure
The `ampd.proto` file defines two main services:

1. **Blockchain Service** - Handles blockchain interactions:
   - Subscribe to blockchain events
   - Broadcast transactions
   - Query contracts
   - Retrieve addresses and contract information

2. **Crypto Service** - Provides cryptographic operations:
   - Sign messages
   - Retrieve public keys

## Compiling Proto Files
You can compile these proto files for your preferred programming language using the Protocol Buffers compiler (`protoc`).

### Prerequisites
Install the Protocol Buffers compiler:
```bash
brew install protobuf
```

### Compilation Examples

#### Go
```bash
# Install Go plugins
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

# Add go_package option to the proto file
echo 'option go_package = "./gen";' >> ampd.proto

# Compile
protoc --go_out=. --go-grpc_out=. ampd.proto
```

#### Python
```bash
pip install grpcio-tools
protoc --python_out=. --grpc_python_out=. ampd.proto
```

#### JavaScript/TypeScript
```bash
npm install -g grpc-tools
protoc --js_out=import_style=commonjs,binary:. --grpc-web_out=import_style=commonjs,mode=grpcwebtext:. ampd.proto
```

## Architecture Context
These proto files are part of a larger architecture where:

- **Ampd** is a daemon that connects to the Axelar blockchain
- **Ampd SDK** is a client library that enables developers to connect to Ampd

The proto files in this repository define the communication interface between these components.


## Versioning
Changes to these proto files follow semantic versioning. Breaking changes will result in a major version increment.
