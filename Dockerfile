FROM ica10888/openjdk:8u212-jdk-skywalking-6.0.0-ga-v2

WORKDIR /tmp
RUN export DEBIAN_FRONTEND=noninteractive && \
  echo mysql-apt-config mysql-apt-config/enable-repo select mysql-5.7| debconf-set-selections && \
  wget wget https://dev.mysql.com/get/mysql-apt-config_0.8.9-1_all.deb && \
  apt-get update && apt-get install lsb-release && \
  dpkg -i mysql-apt-config_0.8.9-1_all.deb && \
  apt-get update && \
  apt-get install  mysql-community-client -y --allow-unauthenticated && \
  apt-get clean -y && rm -rf \
      "${HOME}/.cache" \
        /var/lib/apt/lists/* \
        /tmp/*               \
        /var/tmp/*

