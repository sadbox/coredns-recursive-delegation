FROM ubuntu:22.04

RUN apt update
RUN apt install -y software-properties-common
RUN add-apt-repository ppa:longsleep/golang-backports
RUN apt update

RUN apt install -y golang-go
RUN apt install -y libunbound-dev
RUN apt install -y git
RUN apt install -y vim
RUN apt install -y dnsutils
RUN apt install -y bind9

RUN git clone https://github.com/coredns/coredns.git coredns

WORKDIR /coredns

RUN echo "unbound:github.com/coredns/unbound" >> ./plugin.cfg

RUN go get github.com/coredns/unbound

RUN go generate

RUN go mod tidy -compat=1.17

RUN go build

COPY zones /zones

CMD ["/zones/run.sh"]
