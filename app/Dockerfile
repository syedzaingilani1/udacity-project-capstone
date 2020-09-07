FROM alpine:3.9

ENV NODE_VERSION 12.18.3

RUN apk update && apk add openssh=7.9_p1-r6 vim=8.1.1365-r0 bash=4.4.19-r1 npm=10.19.0-r0 --no-cache

WORKDIR /tmp

COPY package.json /tmp/

RUN npm install

WORKDIR /usr/src/app

COPY . /usr/src/app/

RUN cp -a /tmp/node_modules /usr/src/app/

EXPOSE 80

CMD ["bash","./docker_start.sh"]
