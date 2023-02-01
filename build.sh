#!/usr/bin/env bash
brew install socat
brew install xquartz
# build container
sudo docker build -t hcr-noetic .
sudo docker run --name hcr hcr-noetic &
sleep 1
sudo docker stop hcr
