#FROM node as build
#WORKDIR /app

# install and app dependencies
#COPY package*.json ./app/

#COPY . .
#RUN npm run prod

#FROM nginx
#COPY .nginx/nginx.conf /etc/nginx/nginx.conf
#COPY --from=build /app/dist/organic-client/ /usr/share/nginx/html
FROM nginx:alpine
COPY /dist/organic-client /usr/share/nginx/html

EXPOSE 80