U_ID := $(shell id -u)
G_ID := $(shell id -g)

build:
	@git clone https://github.com/ros-simulation/gazebo_ros_pkgs.git magni_gazebo/gazebo_ros_pkgs
	@cd magni_gazebo/gazebo_ros_pkgs && git checkout kinetic-devel && cd ../..
	@git clone http://github.com/ubiquityrobotics/magni_robot magni_gazebo/magni_robot
	@git clone https://github.com/UbiquityRobotics/oled_display_node.git magni_gazebo/oled_display_node
	@docker build --tag=magni:gazebo --network=host magni_gazebo/.
