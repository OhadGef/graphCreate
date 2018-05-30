FROM node:alpine

WORKDIR opt/app

COPY . opt/app

RUN npm install

COPY . opt/app

CMD node createGraph.js

