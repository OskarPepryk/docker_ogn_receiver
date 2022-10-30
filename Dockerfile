FROM debian:buster 

RUN mkdir /ogn
WORKDIR /ogn

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ="Europe/Warsaw"

RUN dpkg --add-architecture armhf
RUN DEBIAN_FRONTEND=noninteractive && TZ="Europe/Warsaw"
RUN apt update 
RUN apt-get -y install libc6:armhf libncurses5:armhf libstdc++6:armhf libconfig9:armhf libjpeg-dev:armhf libfftw3-dev:armhf lynx wget procserv nano ntp ntpdate telnet rtl-sdr:armhf

RUN wget http://snapshot.debian.org/archive/debian/20141009T042436Z/pool/main/libj/libjpeg8/libjpeg8_8d1-2_armhf.deb
RUN apt-get -y install ./libjpeg8_8d1-2_armhf.deb

RUN wget http://download.glidernet.org/arm/rtlsdr-ogn-bin-ARM-latest.tgz && \
tar xvzf rtlsdr-ogn-bin-ARM-latest.tgz
WORKDIR /ogn/rtlsdr-ogn

VOLUME /ogn/rtlsdr-ogn/config

EXPOSE 8080
EXPOSE 8081

ADD rtlsdr-ogn.conf /etc/
ADD ogn.sh /
RUN chmod +x /ogn.sh


CMD ["/ogn.sh"]
