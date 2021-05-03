FROM debian:buster-slim

LABEL maintainer Sebastian Sasu <sebi@nologin.ro>

RUN apt update && apt install wget gnupg2 -y \
  && wget -qO - https://pkg.dns-oarc.net/dns-oarc.distribution.key.gpg | apt-key add - \
  && echo "deb http://pkg.dns-oarc.net/debian buster main" | tee /etc/apt/sources.list.d/dns-oarc.list \
  && apt update \
  && apt install dnsperf dnsjit dsc dsp dsc-datatool dnscap drool resperf packetq dnsmeter -y

CMD ["sh"]
