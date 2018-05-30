FROM node:alpine

WORKDIR /app

COPY . /app

RUN npm install

RUN mkdir -p ./data

COPY . /app


CMD node createGraph.js

