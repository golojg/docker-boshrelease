#!/bin/bash

set -e # exit immediately if a simple command exits with a non-zero status

# move config file
cp /var/vcap/jobs/docker/etc/rsyslog.d/21-docker.conf /etc/rsyslog.d/21-docker.conf

# Create docker service log directory
export SERVICE_LOG_DIR="/var/vcap/sys/log/docker-services"
if [ ! -d ${SERVICE_LOG_DIR} ]; then
  mkdir -p ${SERVICE_LOG_DIR}
  chown -R vcap:vcap ${SERVICE_LOG_DIR}
  chmod 770 ${SERVICE_LOG_DIR}
fi

# Restart rsyslog to apply new changes
sudo service rsyslog restart
