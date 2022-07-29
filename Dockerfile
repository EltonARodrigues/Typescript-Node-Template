FROM node:16.15-alpine as builder

WORKDIR /builder

COPY package*.json ./

COPY . .

RUN npm install

RUN npm run build

FROM node:16.15-alpine

ENV NODE_ENV production

ARG MAX_OLD_SPACE_SIZE=6144

RUN apk add --no-cache tini

WORKDIR /project-build

COPY package*.json ./

RUN npm config list
RUN npm ci && npm cache clean --force

COPY --from=builder /builder/build ./build

ENV NODE_OPTIONS=--max_old_space_size=$MAX_OLD_SPACE_SIZE
ENV TZ America/Sao_Paulo
ENV TRACER_PATH /logs/
ENV CONFIG_PATH /project-build/config/config.json

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["node", "build/app.js"]

