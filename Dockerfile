FROM node:latest
# USER jenkins
RUN apt update
RUN apt-get -y install sudo
WORKDIR /app
COPY . .
RUN whoami
# RUN chown jenkins:jenkins .
# RUN yarn install --production
# CMD ["node", "src/index.js"]
# RUN node src/index.js
