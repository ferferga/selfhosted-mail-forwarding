#!/bin/bash

## Configures email forwarding based on environment variables
if [[ "$*" = "/scripts/run.sh" ]]; then
    echo "==== Starting Postfix setup ===="
    echo ""
    /scripts/setup.sh
    echo ""
    echo "==== Postfix setup finished! ===="
    echo ""
fi
exec "$@"
