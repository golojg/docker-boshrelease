#!/bin/bash

set -e # exit immediately if a simple command exits with a non-zero status

# move config file
cp /var/vcap/jobs/docker/etc/rsyslog.d/69-docker.conf /etc/rsyslog.d/69-docker.conf

# Restart rsyslog to apply new changes
sudo service rsyslog restart
