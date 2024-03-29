FROM nginx:1.13.3-alpine

## Copy our nginx config
COPY nginx/ /etc/nginx/conf.d/

## Remove default nginx website
# RUN rm -rf /usr/share/nginx/html/*
RUN rm -rf /usr/share/nginx/html/* && chmod -R 777 /var/log/nginx /var/cache/nginx/ && chmod -R 777 /etc/nginx/* && chmod -R 777 /var/run/ && chmod -R 777 /usr/share/nginx/

## copy over the artifacts in dist folder to default nginx public folder
COPY dist/ /usr/share/nginx/html

EXPOSE 8080

COPY --chown=1001:0 . /opt/app-root/src/dist/out-tsc/

CMD ["nginx", "-g", "daemon off;"]


