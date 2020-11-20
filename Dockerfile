# Build phase - build react app

FROM node:alpine as builder

WORKDIR usr/app

COPY package.json .

RUN yarn

COPY . .

RUN yarn build

# Run phase - nginx

FROM nginx

COPY --from=builder /usr/app/build /usr/share/nginx/html

