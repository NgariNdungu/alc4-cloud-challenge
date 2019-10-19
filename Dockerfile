FROM node:lts-stretch as build
COPY ./app /app
WORKDIR /app
RUN yarn build

FROM nginx:1-alpine
COPY --from=build /app/build /usr/share/nginx/html

