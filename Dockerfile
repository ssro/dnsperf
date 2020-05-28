FROM alpine:latest

LABEL maintainer Sebastian Sasu <sebi@nologin.ro>

ENV DNSPERF dnsperf-2.3.4

RUN apk add --update --no-cache --virtual deps wget g++ make bind-dev openssl-dev libxml2-dev libcap-dev json-c-dev krb5-dev protobuf-c-dev fstrm-dev \
  && apk add --update --no-cache bind libcrypto1.1 \
  && wget https://www.dns-oarc.net/files/dnsperf/$DNSPERF.tar.gz \
  && tar zxvf $DNSPERF.tar.gz \
  && cd $DNSPERF \
  && sh configure \
  && make \
  && strip ./src/dnsperf ./src/resperf \
  && make install \
  && apk del deps \
  && rm -rf /$DNSPERF*

# Use this if you want to integrate the sample query file

#RUN apk add --update --no-cache wget \
#   && wget https://www.dns-oarc.net/files/dnsperf/data/queryfile-example-10million-201202.gz \
#   && gunzip queryfile-example-10million-201202.gz \
#   && rm -rf queryfile-example-10million-201202.gz \
#   && apk del wget

CMD ["sh"]
