# coredns-recursive-delegation
Testing cordons recursive delegation stuff
```
~/coredns-recursive-delegation (main) ❯ docker run -it f64a97ccd827ca0b49aba28d87b8f5724a933480133668391137bb634507801f
root@a8e100c12058:/coredns# dig @127.0.0.1 server1.example.org

; <<>> DiG 9.18.1-1ubuntu1.2-Ubuntu <<>> @127.0.0.1 server1.example.org
; (1 server found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 5336
;; flags: qr aa rd ra; QUERY: 1, ANSWER: 2, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 1232
; COOKIE: d2c457768538a4f40100000063365ed09cf7ea2a0a6eff65 (good)
;; QUESTION SECTION:
;server1.example.org.		IN	A

;; ANSWER SECTION:
server1.example.org.	86400	IN	CNAME	server1.delegated.example.org.
server1.delegated.example.org. 86400 IN	A	1.2.3.4

;; Query time: 3 msec
;; SERVER: 127.0.0.1#53(127.0.0.1) (UDP)
;; WHEN: Fri Sep 30 03:13:20 UTC 2022
;; MSG SIZE  rcvd: 135

root@a8e100c12058:/coredns# dig @127.0.0.3 server1.example.org

; <<>> DiG 9.18.1-1ubuntu1.2-Ubuntu <<>> @127.0.0.3 server1.example.org
; (1 server found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 40405
;; flags: qr aa rd; QUERY: 1, ANSWER: 1, AUTHORITY: 1, ADDITIONAL: 1
;; WARNING: recursion requested but not available

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 1232
; COOKIE: b51d3dd5c9064e7d (echoed)
;; QUESTION SECTION:
;server1.example.org.		IN	A

;; ANSWER SECTION:
server1.example.org.	86400	IN	CNAME	server1.delegated.example.org.

;; AUTHORITY SECTION:
example.org.		86400	IN	NS	dns1.example.org.

;; Query time: 1 msec
;; SERVER: 127.0.0.3#53(127.0.0.3) (UDP)
;; WHEN: Fri Sep 30 03:13:24 UTC 2022
;; MSG SIZE  rcvd: 163
```
