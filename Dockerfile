FROM node:latest
# USER root  by default it is already root user!
RUN apt update
RUN apt-get -y install sudo
WORKDIR /app
COPY . .
# RUN whoami <- will be root by default!!!
RUN chown node:node .
# RUN yarn install --production
# CMD ["node", "src/index.js"]
# RUN node src/index.js
