# Using Scripts
It should be possible to run everything using just these scripts if homebrew and docker are installed
- To start build the container and install GUI passing programs run 
```
./build.sh
```
- To start the docker container run the following command. This should be run once per session and have roscore immediately run in it
```
./start.sh
```
- To create a terminal through which GUI apps can be passed run 
```
./terminal.sh
````

# Setup

- First install
```
brew install socat
brew install xquartz
```
- Then restart computer

## Create Container

- This command creates a container called hcr

```
sudo docker run -it --name hcr hcrnoetic
```

- To start the container run
```
sudo docker start -i hcr
```
- To enable GUI access run in a terminal
```
socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"
```
- Then run the following, and when a white terminal appears open the app settings, go to security and allow connections from network clients
```
open -a Xquartz
```
- To open additional terminals with GUI access, {IP} is the current ip address that can be found with "ifconfigen0" command under inet
```
sudo docker exec -e DISPLAY={IP}:0 -it hcr bash
```

## Example Script
- To test run 
```
rosrun turtlesim turtlesim_node
```