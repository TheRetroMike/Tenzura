FROM ubuntu:22.04
RUN apt-get update -y
RUN DEBIAN_FRONTEND=noninteractive apt-get install wget build-essential libssl-dev libboost-chrono1.74-dev libboost-filesystem1.74-dev libboost-program-options1.74-dev libboost-system1.74-dev libboost-thread1.74-dev libboost-test1.74-dev qtbase5-dev qttools5-dev bison libexpat1-dev libdbus-1-dev libfontconfig-dev libfreetype-dev libice-dev libsm-dev libx11-dev libxau-dev libxext-dev libevent-dev libxcb1-dev libxkbcommon-dev libminiupnpc-dev libprotobuf-dev libqrencode-dev xcb-proto x11proto-xext-dev x11proto-dev xtrans-dev zlib1g-dev libczmq-dev autoconf automake libtool protobuf-compiler -y
WORKDIR /opt/
RUN wget https://github.com/Tenzura/Tenzura/releases/download/4.6.1/tenzura-4.6.1.0-ubuntu22.04.tar.gz
RUN tar zxvf tenzura-4.6.1.0-ubuntu22.04.tar.gz
RUN mv tenzura-4.6.1.0-ubuntu22.04/tenzurad /usr/bin/tenzurad
RUN mv tenzura-4.6.1.0-ubuntu22.04/tenzura-cli /usr/bin/tenzura-cli
RUN rm -R tenzura-4.6.1.0-ubuntu22.04
RUN rm tenzura-4.6.1.0-ubuntu22.04.tar.gz
RUN wget https://raw.githubusercontent.com/TheRetroMike/rmt-nomp/master/scripts/blocknotify.c
RUN gcc blocknotify.c -o /usr/bin/blocknotify
CMD /usr/bin/tenzurad -printtoconsole
