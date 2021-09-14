FROM node as build
WORKDIR /app

# install and app dependencies
COPY package*.json ./app/
RUN npm install
COPY . .
RUN npm run prod

FROM nginx
COPY .nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/dist/organic-client/ /usr/share/nginx/html