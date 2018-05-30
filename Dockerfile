FROM node:alpine

WORKDIR /app

COPY . /app

RUN npm install

COPY . /app

CMD node createGraph.js

