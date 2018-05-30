FROM node:alpine

WORKDIR opt/app

COPY . opt/app

RUN npm install

RUN mkdir -p /data

COPY . opt/app


CMD node createGraph.js

