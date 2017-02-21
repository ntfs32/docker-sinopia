#/bin/bash

sudo docker run -d -t --name docker-sinopia  -p 0.0.0.0:4873:4873 -v /home/shaddock/Applications/docker/docker-sinopia:/opt/sinopia/host:rw  65472c3c59d5  bash /opt/sinopia/start.sh
