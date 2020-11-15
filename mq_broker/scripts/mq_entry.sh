#!/bin/bash

echo """
MQTT Broker container is running!

Execute following to attach to this container:

    docker exec -it mq_broker mq_bash.sh

To stop all containers hit: Ctrl+C
"""

tail -f /dev/null