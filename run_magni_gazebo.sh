#!/bin/sh

USER_UID=$(id -u)
USER_GID=$(id -g)
XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth

DOCKER_ROOT="$(pwd)"

echo "Running magni:gazebo image"

docker run \
  -it \
  -p 8888:8888 \
  --privileged=true \
  --net=host \
  --volume=/tmp/.X11-unix:/tmp/.X11-unix:rw \
  --volume=/tmp/.docker.xauth:/tmp/.docker.xauth:rw \
  --volume=/dev/bus/usb:/dev/bus/usb:rw \
  --volume=/dev:/dev:rw \
  --volume=/home/$USER/.config/dconf:/home/user/.config/dconf:rw \
  --volume=/home/$USER/.config/gedit:/home/user/.config/gedit:rw \
  --volume=/home/$USER/.config/terminator:/home/user/.config/terminator:rw \
  --volume=/usr/lib/nvidia-430:/usr/lib/nvidia-430 \
  --volume=/usr/lib32/nvidia-4300:/usr/lib32/nvidia-430 \
  --env="XAUTHORITY=${XAUTH}" \
  --env="USER_UID=${USER_UID}" \
  --env="USER_GID=${USER_GID}" \
  --env="DISPLAY=${DISPLAY}" \
  --env="QT_X11_NO_MITSHM=1" \
  --name=magni_ubiquity_test \
  magni:gazebo /bin/bash

export containerId='docker ps -l -q'
