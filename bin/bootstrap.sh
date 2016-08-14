#! /usr/bin/env bash

function log() {
  echo "$HOST_IP: $1"
}

export HOST_IP=$(ip -o -4 addr list eth0 | grep -oE "([0-9]+[.])+[0-9]+")
NETWORK_MASK=$(ip -o -4 route | sed -En 's/([0-9]+[.][0-9]\/[0-9]+) .*/\1/p')
EKKO_MULTICAST=224.1.0.1
EKKO_POLL_RATE=30


log "$0: Botstrapped completed"
log "$0: $SERVICE_NAME - $HOST_IP:$SERVICE_PORT"
