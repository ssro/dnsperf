FROM alpine:latest

LABEL maintainer Sebastian Sasu <sebi@nologin.ro>

ENV DNSPERF dnsperf-src-2.1.0.0-1

RUN apk add --update --no-cache --virtual deps wget g++ make bind-dev openssl-dev libxml2-dev libcap-dev json-c-dev \
  && apk add --update --no-cache bind libcrypto1.0 \
  && wget ftp://ftp.nominum.com/pub/nominum/dnsperf/2.1.0.0/$DNSPERF.tar.gz \
  && tar zxvf $DNSPERF.tar.gz \
  && cd $DNSPERF \
  && sh configure \
  && make \
  && strip dnsperf resperf \
  && make install \
  && apk del deps \
  && rm -rf /var/cache/apk/* /$DNSPERF*

# Use this if you want to integrate the sample query file

#RUN apk add --update --no-cache wget \
#   && wget ftp://ftp.nominum.com/pub/nominum/dnsperf/data/queryfile-example-current.gz \
#   && gunzip queryfile-example-current.gz \
#   && rm -rf queryfile-example-current.gz \
#   && apk del wget

CMD ["sh"]
