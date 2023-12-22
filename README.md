FeatureFlags service protobuf files

Overview
--------

To generate Python code from protobuf files run:
- ``pdm run protoc``

On mac os be sure to run `pdm install` like this:
- ``CFLAGS="-I /opt/homebrew/opt/openssl/include" LDFLAGS="-L /opt/homebrew/opt/openssl/lib" GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=1 GRPC_PYTHON_BUILD_SYSTEM_ZLIB=1 pdm install -G protoc``

To install package:
- TODO
