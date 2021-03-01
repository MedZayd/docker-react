FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# /usr/build contains the static files of our project

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html