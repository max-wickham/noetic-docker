FROM ros:noetic
VOLUME "/home/$USER:/root"
VOLUME "/tmp/.X11-unix:/tmp/.X11-unix:rw"
ENTRYPOINT ["bash", "-c", "source /opt/ros/noetic/setup.bash ; roscore"]
RUN sudo apt-get update 
RUN sudo apt-get install debconf-utils
COPY keyboard.config /keyboard.config
RUN debconf-set-selections < keyboard.config
RUN export DEBIAN_FRONTEND=noninteractive; sudo apt-get --yes --force-yes install ros-noetic-desktop-full
RUN echo "source /opt/ros/noetic/setup.bash" > /root/.bashrc
