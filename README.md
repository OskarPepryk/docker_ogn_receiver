# docker_ogn_receiver
docker container for OGN receiver (glidernet.org)

Tested on Odroid HC-4 hardware (armhf) running Debian Bullseye.

Use commands below to build the docker image
```
docker build -t 'ogn_receiver' .
```


Use command below to run the image. Subsitute config directory with an actual one with a proper config file.
```
docker run -it -v /path-to-your-config-dir/:/ogn/rtlsdr-ogn/config --device=/dev/bus/usb:/dev/bus/usb --name ogn -p 8180:8080 -p 8181:8081 --restart=on-failure -d ogn_receiver
```
