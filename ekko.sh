#! /bin/sh

EKKO_IP=$(ip -o -4 addr list eth0 | grep -oE "([0-9]+[.])+[0-9]+")
EKKO_MASK=$(ip -o -4 route | sed -En 's/([0-9]+[.][0-9]\/[0-9]+) .*/\1/p')
EKKO_MULTICAST=224.1.0.1

export EKKO_IP
export EKKO_MASK
export EKKO_MULTICAST

./tusse.sh || ./troll.sh
