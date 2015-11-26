#! /bin/sh

log() {
  echo "$EKKO_IP - Goblin: $1"
}

service_json="{\"service\":\"${SERVICE}\",\"ip\":\"${EKKO_IP}\", \"service_port\":\"${SERVICE_PORT}\"}"

sleep 1 # TODO figure out why we need this

log "Entering the forest of: ${EKKO_MULTICAST} owned by the family: ${EKKO_MASK}"
log "Calling for the master Troll"
response=$(echo | socat STDIO UDP4-DATAGRAM:"${EKKO_MULTICAST}":6666,range="${EKKO_MASK}")
heartbeats=hugs

if [[ -n "$response" ]]; then
  while [[ -n "$heartbeats" ]]; do
   log "Standing by for our master Troll:${response}"
   heartbeats=$(timeout -t "${EKKO_TIMEOUT}" socat -d UDP4-RECVFROM:6666,ip-add-membership="${response}":"${EKKO_IP}",fork EXEC:"echo $service_json"  2>&1 | grep 'Connection reset by peer')
   echo "$heartbeats"
  done
  log "Our troll is dead. We shall move on to the next master"
else
  log "I'm all alone. I'll be the troll"
  exit 1
fi
