#!/bin/bash
nohup /coredns/coredns -conf /zones/secondary.conf >/tmp/secondary.log 2>&1 &

nohup /coredns/coredns -conf /zones/main.conf >/tmp/main.log 2>&1 &
nohup named -f -g -c /zones/main-bind.conf >/tmp/named.log 2>&1 &

exec /bin/bash
