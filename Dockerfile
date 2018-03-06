FROM node:9.7.1

COPY assets/debian/.bashrc /root/.bashrc

RUN set -ex; \
  ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime; \
  dpkg-reconfigure -f noninteractive tzdata; \
  yarn config set disable-self-update-check true
