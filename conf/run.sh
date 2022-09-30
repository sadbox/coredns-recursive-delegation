#!/bin/bash
nohup /coredns/coredns -conf /conf/secondary.conf >/tmp/secondary.log 2>&1 &

nohup /coredns/coredns -conf /conf/main-coredns.conf >/tmp/main.log 2>&1 &
nohup named -f -g -c /conf/main-bind.conf >/tmp/named.log 2>&1 &

exec /bin/bash
