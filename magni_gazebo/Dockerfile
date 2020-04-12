FROM ros:kinetic-ros-base-xenial

MAINTAINER Pierre Desreumaux, <pierre.desreumaux@hotmail.fr>

ARG USER_ID
ARG USER_GID
ENV USER_ID $USER_ID
ENV USER_GID $USER_GID

USER root

#setup user
ENV USERNAME user
RUN /bin/bash -c "useradd ${USERNAME} && \
    echo '$USERNAME:$USERNAME' | chpasswd && \
    usermod -aG sudo ${USERNAME} && \
    echo '$USERNAME ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/$USERNAME && \
    chmod 0440 /etc/sudoers.d/$USERNAME"

# install ros packages
RUN apt-get update && apt-get install -y \
    ros-kinetic-robot=1.3.2-0* \
    && rm -rf /var/lib/apt/lists/*

RUN /bin/bash -c ". /opt/ros/kinetic/setup.bash; \
    mkdir -p /home/user/catkin_ws/src; \
    cd /home/user/catkin_ws; \
    catkin_make; \
    source devel/setup.bash;"

RUN apt-get update && apt-get install -y \
    build-essential \
    mesa-common-dev \
    software-properties-common \
    apt-utils \
    ros-kinetic-gazebo-ros-pkgs \
    ros-kinetic-gazebo-ros-control \
    ros-kinetic-rqt \
    ros-kinetic-rqt-robot-steering

COPY gazebo_ros_pkgs /home/user/catkin_ws/src/gazebo_ros_pkgs

COPY oled_display_node /home/user/catkin_ws/src/oled_display_node

RUN apt-get install -y \
    libgazebo7-dev

RUN /bin/bash -c "rosdep check --from-paths /home/user/catkin_ws/ --ignore-src --rosdistro kinetic; \
    source /opt/ros/kinetic/setup.bash; \
    cd /home/user/catkin_ws; \
    catkin_make;"

#install magni robot packages
COPY magni_robot /home/user/catkin_ws/src/magni_robot

RUN /bin/bash -c "rosdep install --from-paths /home/user/catkin_ws/src --ignore-src --rosdistro=kinetic -y; \
    source /opt/ros/kinetic/setup.bash; \
    source /home/user/catkin_ws/devel/setup.bash; \
    cd /home/user/catkin_ws; \
    catkin_make;"

USER root
RUN chown -R user:user /home/user
