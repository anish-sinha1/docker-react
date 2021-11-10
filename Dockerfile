FROM node:16-alpine as builder
WORKDIR '/usr/app'
COPY package.json .
RUN yarn
COPY . .
RUN yarn build


FROM nginx
EXPOSE 80
COPY --from=builder /usr/app/build /usr/share/nginx/html
