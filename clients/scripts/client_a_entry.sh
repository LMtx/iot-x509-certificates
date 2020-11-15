#!/bin/bash

echo """
Client A container is running!

Execute following to attach to this container:

    docker exec -it client_a client_a_bash.sh

To stop all containers hit: Ctrl+C
"""

tail -f /dev/null