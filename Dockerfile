FROM ubuntu:22.04
RUN apt-get update -y
RUN apt-get install wget build-essential -y
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
