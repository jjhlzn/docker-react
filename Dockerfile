FROM node:16-alpine as builder
WORKDIR /app
COPY ./package.json .
RUN npm --registry https://registry.npm.taobao.org install 
COPY . . 
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html 
