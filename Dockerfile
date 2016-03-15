FROM node:4.2


RUN apt-get update &&\
  apt-get install -y \
  xvfb \
  x11-xkb-utils \
  xfonts-100dpi \
  xfonts-75dpi \
  xfonts-scalable \
  xfonts-cyrillic \
  x11-apps \
  clang \
  libdbus-1-dev \
  libgtk2.0-dev \
  libnotify-dev \
  libgnome-keyring-dev \
  libgconf2-dev \
  libasound2-dev \
  libcap-dev \
  libcups2-dev \
  libxtst-dev \
  libxss1 \
  libnss3-dev \
  gcc-multilib \
  g++-multilib

ENV DEBUG="nightmare"

RUN mkdir -p /app
ADD . /app

#ENV npm_config_arch=x64
#ENV platform=linux
WORKDIR /app

RUN npm install segmentio/nightmare

# Default command. Assumes our file is index.js and our screen size is 1024x768
CMD npm install vo ; xvfb-run --server-args="-screen 0 1024x768x24" node index.js
