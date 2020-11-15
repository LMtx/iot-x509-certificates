#!/bin/bash

echo """
Private CA container is running!

Execute following to attach to this container:

    docker exec -it my_private_ca ca_bash.sh

To stop all containers hit: Ctrl+C
"""

tail -f /dev/null