#
# Dockerfile for cpuminer
# sudo docker build ./ -t cpuminer
# ex: sudo docker run cpuminer -a lyra2rev2 --url stratum+tcp://stratum-jp.asicpool.info:2101 -u koji.vps1g -p vps1g -t 1
#
#

FROM            ubuntu:latest
MAINTAINER      Guillaume J. Charmes <guillaume@charmes.net>

RUN             apt-get update -qq

RUN             apt-get install -qqy automake
RUN             apt-get install -qqy libcurl4-openssl-dev build-essential
RUN             apt-get install -qqy git
RUN             apt-get install -qqy make
RUN             apt-get install -qqy autoconf pkg-config libcurl4-openssl-dev libjansson-dev libssl-dev libgmp-dev make g++

RUN             git clone https://github.com/tpruvot/cpuminer-multi
RUN             cd cpuminer-multi && ./build.sh

WORKDIR         /cpuminer-multi
ENTRYPOINT      ["./cpuminer"]
