FROM ubuntu:24.04

RUN apt-get update 
RUN  apt-get install -y locales 
#RUN    sudo locale-gen en_US en_US.UTF-8 
#RUN    sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 
#RUN    export LANG=en_US.UTF-8


RUN  apt install software-properties-common -y && \
     add-apt-repository universe -y
    

RUN  apt update 
RUN  apt install curl -y 

RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg &&\
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" |  tee /etc/apt/sources.list.d/ros2.list > /dev/null


RUN  apt update -y && apt upgrade -y

RUN  apt install ros-jazzy-desktop -y 
RUN apt install ros-dev-tools -y

RUN echo "source /opt/ros/jazzy/setup.bash" >> ~/.bashrc

RUN echo $ROS_DISTRO

RUN apt-get install terminator -y

RUN  apt-get install ros-jazzy-ros2-control -y &&\
     apt-get install ros-jazzy-ros2-controllers -y &&\
     apt-get install ros-jazzy-xacro -y &&\
     apt-get install ros-jazzy-ros-gz-* -y &&\
     apt-get install ros-jazzy-*-ros2-control -y &&\
     apt-get install ros-jazzy-joint-state-publisher-gui -y &&\
     apt-get install ros-jazzy-tf-transformations -y &&\
     apt-get install ros-jazzy-moveit* -y

RUN   apt-get install python3-pip -y &&\
      apt-get install python3-transforms3d -y &&\
      apt-get install python3-flask -y &&\
      pip3 install pyserial --break-system-packages  &&\
      pip3 install flask-ask-sdk --break-system-packages &&\
      pip3 install ask-sdk --break-system-packages


RUN echo 'alias cb="colcon build"' >> ~/.bashrc &&\
     echo 'alias cc="colcon build --symlink-install"' >> ~/.bashrc &&\
     echo 'alias si="source install/setup.bash"' >> ~/.bashrc



RUN     apt-get install -y vim && \
        apt-get install gedit  -y 

# Switch to the custom user
USER 1000

WORKDIR /home/ubuntu/