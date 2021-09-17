#FROM node as build
#WORKDIR /app

# install and app dependencies
#COPY package*.json ./app/

#COPY . .
#RUN npm run prod

#FROM nginx
#COPY .nginx/nginx.conf /etc/nginx/nginx.conf
#COPY --from=build /app/dist/organic-client/ /usr/share/nginx/html
# stage 1

FROM node:alpine AS my-app-build
WORKDIR /app
COPY . .
RUN npm ci && npm run build

# stage 2

FROM nginx:alpine
COPY --from=my-app-build /app/dist/app-to-run-inside-docker /usr/share/nginx/html
EXPOSE 4500

EXPOSE 80