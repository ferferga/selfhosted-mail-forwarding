#!/bin/bash

echo "Starting postfix..."
echo ""
rm -rf /var/spool/postfix/pid/master.pid

exec /usr/sbin/postfix start-fg
