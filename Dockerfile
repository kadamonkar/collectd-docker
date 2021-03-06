#
# Dockerfile for collectd
#

FROM alpine:3.4

MAINTAINER Onkar Kadam

RUN apk add --no-cache collectd collectd-dev

COPY ./collectd /etc/collectd

VOLUME /etc/collectd /var/lib/collectd /hostfs

CMD ["collectd", "-f"]
