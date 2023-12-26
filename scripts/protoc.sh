#!/bin/bash
set -e

HIKU_PROTO_PATH="$(python3 -c 'import os.path, hiku; print(os.path.dirname(os.path.dirname(hiku.__file__)))')"
export HIKU_PROTO_PATH

python3 -m grpc_tools.protoc \
  --proto_path=. \
  --proto_path="$HIKU_PROTO_PATH" \
  --python_out=. \
  featureflags_protobuf/*.proto

python3 -m grpc_tools.protoc \
  --proto_path=. \
  --proto_path="$HIKU_PROTO_PATH" \
  --python_out=. \
  --python_grpc_out=. \
  --grpc_python_out=. \
  featureflags_protobuf/service.proto
