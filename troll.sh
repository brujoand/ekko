#! /bin/sh

log() {
  echo "$EKKO_IP - Troll: $1"
}

cave="230.${EKKO_IP#*.}"
log "Waiting at my cave (${cave}) next to the forest of: ${EKKO_MULTICAST} answering all from the family of: ${EKKO_MASK}"
socat UDP4-RECVFROM:6666,ip-add-membership="$EKKO_MULTICAST":"${EKKO_IP}",fork EXEC:"echo ${cave}" &
while true; do
  log "Calling all goblins to report for service"
  goblins=$(echo | socat STDIO UDP4-DATAGRAM:"${cave}":6666,range="${EKKO_MASK}")
  if [[ -n "${goblins}" ]]; then
    log "Found these poor goblins: ${goblins}"
  else
    log "There is nobody here.."
  fi

  sleep "$(( EKKO_TIMEOUT / 2 ))"
done
