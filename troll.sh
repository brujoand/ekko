#! /bin/sh
echo "Troll: Entering the forest with multicast: ${EKKO_MULTICAST} mask: ${EKKO_MASK} ip: ${EKKO_IP}"
echo "Troll: I'm waiting"
socat UDP4-RECVFROM:6666,ip-add-membership="$EKKO_MULTICAST":"${EKKO_IP}",fork EXEC:"echo ${EKKO_IP}"
