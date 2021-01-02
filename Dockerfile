FROM node:10.7.010.23.0-buster

COPY assets/.profile /root/.profile

RUN set -ex; \
  ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime; \
  echo "export EDITOR='nano'" >> /root/.profile; \
  echo "export VISUAL='nano'" >> /root/.profile; \
  dpkg-reconfigure -f noninteractive tzdata; \
  yarn config set disable-self-update-check true; \
  apt-get update; \
  apt-get install -qq -y --no-install-recommends nano; \
  apt-get autoremove -qq -y; \
  apt-get autoclean -qq -y; \
  apt-get clean -qq -y; \
  rm -rf /var/lib/apt/lists/*
