FROM node:12-alpine
WORKDIR /app
COPY . .
RUN yarn install --production
# CMD ["node", "src/index.js"]
RUN node src/index.js
