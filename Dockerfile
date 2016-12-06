FROM gliderlabs/alpine:latest
MAINTAINER Andrew Tynefield <atynefield@gmail.com>

RUN apk add --no-cache readline-dev zlib-dev lzo-dev openssl-dev linux-headers gcc g++ make ncurses-dev libpcap-dev readline zlib lzo libpcap && \
  wget http://www.tinc-vpn.org/packages/tinc-1.1pre14.tar.gz && \
  tar xzvf tinc-1.1pre14.tar.gz && \
  cd tinc-1.1pre14 && \
  ./configure --enable-jumbograms --enable-tunemu --sysconfdir=/etc --localstatedir=/var && \
  make && make install src && \
  cd ../ && \
  rm -rfv tinc-1.1pre14 && apk del --no-cache --purge readline-dev zlib-dev lzo-dev openssl-dev linux-headers gcc g++ make ncurses-dev libpcap-dev libc-utils 

EXPOSE 655/tcp 655/udp
VOLUME /etc/tinc
