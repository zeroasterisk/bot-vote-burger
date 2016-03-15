FROM node:4.4

RUN mkdir -p /app
ADD . /app

#ENV npm_config_arch=x64
#ENV platform=linux
WORKDIR /app

CMD ["npm", "start"]
