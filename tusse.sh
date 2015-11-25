#! /bin/sh

sleep 1

echo "Tusse: Entering the forest with multicast: ${EKKO_MULTICAST} mask: ${EKKO_MASK} ip: ${EKKO_IP}"
echo "Tusse: Yelling for trolls"
response=$(echo | socat STDIO UDP4-DATAGRAM:"${EKKO_MULTICAST}":6666,range="${EKKO_MASK}")

if [[ -n "$response" ]]; then
  echo "Tusse: Jay, we found a troll: ${response}"
else
  echo "Tusse: I'm all alone. I'll be the troll"
  exit 1
fi
