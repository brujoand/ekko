#! /bin/ash

EKKO_IP=$(ip -o -4 addr list eth0 | grep -oE "([0-9]+[.])+[0-9]+")
EKKO_MASK=$(ip -o -4 route | sed -En 's/([0-9]+[.][0-9]\/[0-9]+) .*/\1/p')
EKKO_MULTICAST=224.1.0.1
EKKO_TIMEOUT=30

export EKKO_IP
export EKKO_MASK
export EKKO_MULTICAST
export EKKO_TIMEOUT

while true; do
  ./goblin.sh
  if [[ $? -eq 1 ]]; then
    ./troll.sh
  fi
done
