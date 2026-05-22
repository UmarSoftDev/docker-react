FROM node:26-alpine3.22 as builder

WORKDIR /app


COPY ./package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx

COPY --from=builder /app/build usr/share/nginx/html

