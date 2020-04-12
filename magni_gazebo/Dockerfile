FROM ros:kinetic-ros-base-xenial

MAINTAINER Pierre Desreumaux, <pierre.desreumaux@hotmail.fr>

USER root
# install ros packages
RUN apt-get update && apt-get install -y \
    ros-kinetic-robot=1.3.2-0* \
    && rm -rf /var/lib/apt/lists/*

RUN /bin/bash -c ". /opt/ros/kinetic/setup.bash; \
    mkdir -p /home/user/catkin_ws/src; \
    cd /home/user/catkin_ws; \
    catkin_make; \
    source devel/setup.bash;"

RUN apt-get install -y \
    ros-kinetic-gazebo-ros-pkgs \
    ros-kinetic-gazebo-ros-control \
    ros-kinetic-rqt \
    ros-kinetic-rqt-robot-steering

RUN /bin/bash -c "cd /home/user/catkin_ws/src; \

COPY gazebo_ros_pkgs /home/user/catkin_ws/src/gazebo_ros_pkgs

RUN apt-get install -y \
    libgazebo7-dev


RUN /bin/bash -c "rosdep check --from-paths . --ignore-src --rosdistro kinetic; \
    catkin_make;
    source /opt/ros/kinetic/setup.bash; \
    source /home/user/catkin_ws/devel/setup.bash;"

COPY magni_robot /home/user/catkin_ws/src/magni_robot

RUN /bin/bash -c "rosdep install --from-paths src --ignore-src --rosdistro=kinetic -y; \
    catkin_make;"

USER user
