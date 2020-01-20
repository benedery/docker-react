FROM node:alpine as frontend
WORKDIR /app
COPY package.json .
RUN yarn install
COPY . .
RUN yarn run build


FROM nginx:latest
EXPOSE 80
COPY --from=frontend /app/build /usr/share/nginx/html
