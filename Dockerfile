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

RUN npm install
RUN npm install -g @angular/cli@7.3.9
COPY . /app
CMD ng serve --host 0.0.0.0

EXPOSE 80