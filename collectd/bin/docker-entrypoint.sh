#!/bin/sh

addgroup -g 1010 collectd
adduser -h /var/lib/collectd -s /bin/sh -u 1010 -G collectd -H -D collectd
chown -R collectd:collectd /var/lib/collectd /etc/collectd
collectd -f
