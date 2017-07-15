FROM node:8.1.4

COPY assets/debian/.bashrc /root/.bashrc
COPY assets/.yarnrc /.yarnrc

RUN set -ex; \
  ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime; \
  dpkg-reconfigure -f noninteractive tzdata

CMD bash -l
