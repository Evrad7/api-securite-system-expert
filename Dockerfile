FROM ubuntu:jammy

RUN apt update \
&& apt-get install -y wget  gnupg gnupg1 gnupg2 systemctl sudo  
# && rm -rf /var/lib/apt/lists/*

RUN apt-get install -y redis-server 

# RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927

RUN wget --content-disposition "https://packagecloud.io/tyk/tyk-gateway/packages/ubuntu/jammy/tyk-gateway_5.0.15_amd64.deb/download.deb?distro_version_id=237"

RUN dpkg -i tyk-gateway_5.0.15_amd64.deb

RUN rm tyk-gateway_5.0.15_amd64.deb

RUN /opt/tyk-gateway/install/setup.sh --listenport=8080 --redishost=127.0.0.1 --redisport=6379 --domain=""

CMD ["/bin/bash", "-c", "service redis-server start && systemctl start tyk-gateway && /bin/bash"]



