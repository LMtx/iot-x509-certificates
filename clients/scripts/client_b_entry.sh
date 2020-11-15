#!/bin/bash

echo """
Client B container is running!

Execute following to attach to this container:

    docker exec -it client_b client_b_bash.sh

To stop all containers hit: Ctrl+C
"""

tail -f /dev/null