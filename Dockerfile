FROM node:alpine3.20

LABEL org.opencontainers.image.source=https://github.com/XCQ0607/nodejs-argo
LABEL org.opencontainers.image.description="nodejs docker version"
LABEL org.opencontainers.image.licenses=MIT

WORKDIR /tmp

COPY . .

EXPOSE 3000/tcp

RUN apk update && apk upgrade &&\
    apk add --no-cache openssl curl gcompat iproute2 coreutils &&\
    apk add --no-cache bash &&\
    chmod +x index.js &&\
    npm install

CMD ["node", "index.js"]
