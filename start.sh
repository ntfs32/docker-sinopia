#!/bin/bash

config_file='/opt/sinopia/samman.yaml'

if [ -f "/opt/sinopia/host/sammam.yaml" ]
then
$config_file='/opt/sinopia/host/samman.yaml'
fi
echo $config_file
node /opt/sinopia/node_modules/sinopia/bin/sinopia --config $config_file
