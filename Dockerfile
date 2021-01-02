FROM node:10.7.0-buster

COPY assets/.profile /root/.profile

RUN set -ex; \
  ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime; \
  mv /root/.profile /root/.bashrc; \
  dpkg-reconfigure -f noninteractive tzdata; \
  yarn config set disable-self-update-check true; \
  apt-get update -qq; \
  apt-get install -qq --no-install-recommends nano >/dev/null; \
  apt-get autoremove -qq; \
  apt-get autoclean -qq; \
  apt-get clean -qq; \
  rm -rf /var/lib/apt/lists/*
