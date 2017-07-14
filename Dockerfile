FROM node:8.1.4

RUN set -ex; \
  ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime; \
  dpkg-reconfigure -f noninteractive tzdata

COPY assets/debian/.profile  /root/.profile

CMD bash -l
