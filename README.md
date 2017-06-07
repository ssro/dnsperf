# DNSPERF

### DNS benchmark tool on docker

Alpine linux build of Nominum [dnsperf](http://nominum.com/measurement-tools/)

This image doesn't include the sample query data file (~73 MB gzipped),
since it would make the image larger.


### Running the image form quay.io

`docker run -it --rm quay.io/ssro/dnsperf`

### Building your own image

1. Clone this repo and `cd` into it
2. `$ docker build -t dnsperf .`
3. `$ docker run -it --rm some-dnsperf dnsperf`

For help just invoke `dnsperf -h` inside the container

### Including the sample query file

Uncomment below code inside dockerfile to include the file and rebuild

```
# RUN wget ftp://ftp.nominum.com/pub/nominum/dnsperf/data/queryfile-example-current.gz \
#  && gunzip queryfile-example-current.gz \
#  && rm -rf queryfile-example-current.gz

```

This will take some time, based on how fast is the download.

Also, the sample file can be downloaded inside the container

### Usage

Query server 127.0.0.1 (using the sample query file) for 60 seconds from 1 client
with 10 requests/sec:

`dnsperf -s 127.0.0.1 -d queryfile-example-current -l 60 -c 1 -Q 10`

Test 2 DNS servers for 30 seconds:

`dnsperf -s 127.0.0.1 -s 127.0.0.2 -d queryfile-example-current -l 30`
