FROM node:12.16-slim as node
WORKDIR /app
COPY package.json /app/
RUN npm i npm@latest -g
RUN npm install
COPY ./ /app/
ARG env=prod
RUN npm run compile
EXPOSE 3001
ENTRYPOINT [ "node", "dist/server.js" ]
