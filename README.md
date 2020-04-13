# docker_magni
a docker image for simulate a magni robot from ubiquity robotics trough gazebo. This project is under [MIT](https://mit-license.org/) License.

# Install Docker

Follow the instructions [here](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/) to install Docker.  

then [here](https://docs.docker.com/engine/installation/linux/linux-postinstall/) to configure your user group docker.  

Be sure that your ssh key are set so you can pull on github.  

# Images available

ROS Kinetic xenial with Gazebo7 and magni simulation setup :

```
docker hub
```

# Get an image built (Easy way)

You can use [Docker Hub](https://gitlab.inria.fr/locolearn/docker_talos/container_registry) of our GitLab to get an image with the robot_framework for OpenSot.  

pull image :  

```
docker pull
```

# Run your Docker :  

```
sudo chmod +x run_magni_gazebo.sh
./magni_gazebo.sh
```

# Build manually your Docker :  

Go inside docker folder, you should have a __Makefile__, then run in a terminal :  

```make build```  

If you are starting it from scratch it will take time (15 min atleast).

The  __Makefile__ is pointing to specific git branch, it should also work at any time with the latest commits

If you have any issue ask me at pierredesreumaux@hotmail.fr
