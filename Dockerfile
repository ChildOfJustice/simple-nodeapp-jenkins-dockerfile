FROM node:latest
USER root
RUN apt update
RUN apt-get -y install sudo
WORKDIR /app
COPY . .
# RUN yarn install --production
# CMD ["node", "src/index.js"]
# RUN node src/index.js
