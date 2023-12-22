FROM ubuntu:focal

ENV TZ=Europe/Kiev
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y git python3-pip && \
    pip3 install \
      "hiku==0.7.0rc35" \
      "grpcio-tools==1.59.0" \
      "protobuf<=4.0.0" \
      "grpclib"

WORKDIR /app
