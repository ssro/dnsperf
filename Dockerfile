FROM alpine:latest

LABEL maintainer Sebastian Sasu <sebi@nologin.ro>

ENV DNSPERF dnsperf-src-2.1.0.0-1

RUN apk add --update wget g++ make bind bind-libs bind bind-dev openssl-dev libxml2-dev libcap-dev \
  && wget ftp://ftp.nominum.com/pub/nominum/dnsperf/2.1.0.0/$DNSPERF.tar.gz \
  && tar zxvf $DNSPERF.tar.gz \
  && cd $DNSPERF \
  && sh configure \
  && make \
  && make install

# Use this if you want to integrate the sample query file

# RUN wget ftp://ftp.nominum.com/pub/nominum/dnsperf/data/queryfile-example-current.gz \
#   && gunzip queryfile-example-current.gz \
#   && rm -rf queryfile-example-current.gz

RUN apk del g++ make libxml2-dev libcap-dev \
  && rm -rf /var/cache/apk/* /$DNSPERF*


CMD ["sh"]
