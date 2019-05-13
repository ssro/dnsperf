# DNSPERF

### DNS benchmark tool on docker

Alpine linux build of Nominum, now DNS-OARC, [dnsperf](http://nominum.com/measurement-tools/)

Building an image out of this repository won't create an image with the sample file, unless you 
explicitly create your own by uncommenting few lines in Dockerfile (see below). However I'm providing an image 
with the compressed sample data file (**`qdf`** tag)


### Running the image form quay.io

```
docker run -it --rm quay.io/ssro/dnsperf
```
or

```
docker run -it --rm quay.io/ssro/dnsperf:qdf
```

### Building your own image

1. Clone this repo and `cd` into it
2. `docker build -t dnsperf .`
3. `docker run -it --rm some-dnsperf dnsperf`

For help just invoke **`dnsperf -h`** inside the container

### Including the sample query file

Uncomment below code inside dockerfile to include the file and rebuild

```
# RUN wget https://www.dns-oarc.net/files/dnsperf/data/queryfile-example-10million-201202.gz \
#  && gunzip queryfile-example-10million-201202.gz \
#  && rm -rf queryfile-example-10million-201202.gz

```

This will take some time, based on how fast is the download.

Also, the sample file can be downloaded inside the container using the above ftp link

### Usage

Query server 127.0.0.1 (using the sample query file) for 60 seconds from 1 client
with 10 requests/sec:

`dnsperf -s 127.0.0.1 -d queryfile-example-10million-201202 -l 60 -c 1 -Q 10`

Test 2 DNS servers for 30 seconds:

`dnsperf -s 127.0.0.1 -s 127.0.0.2 -d queryfile-example-10million-201202 -l 30`
