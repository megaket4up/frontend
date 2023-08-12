FROM node:18-alpine as buildstage

WORKDIR /opt/app

COPY . /opt/app

RUN npm install && npm run build && find . -maxdepth 1   ! \( -name "dist" -o -name "." \) -exec rm -rf {} \;

FROM nginx:1.25.1-alpine

COPY ./docker /
COPY --from=buildstage /opt/app/dist /usr/share/nginx/html

EXPOSE 80
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]