#! /usr/bin/env bash

source bootstrap.sh

sleep 1

read -r -d '' service_description <<EOF
{
  "service" :{
    "name":"${SERVICE_NAME}",
    "ip":"${HOST_IP}",
    "port":"${SERVICE_PORT}"
  }
}
EOF

socat -d UDP4-RECVFROM:6666,ip-add-membership="${EKKO_MULTICAST}":"${HOST_IP}",fork EXEC:"echo ${service_description}"
