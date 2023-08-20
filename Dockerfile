FROM node:16-alpine as BUILD_IMAGE
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=BUILD_IMAGE /app/build /usr/share/nginx/html