#! /usr/bin/env bash

source bootstrap.sh

function perform_shout() {
  echo | socat STDIO UDP4-DATAGRAM:"${EKKO_MULTICAST}":6666,range="${NETWORK_MASK}"
}

function shout_regulary() {
  while true; do
    perform_shout
    sleep "$EKKO_POLL_RATE"
  done
}

perform_shout
