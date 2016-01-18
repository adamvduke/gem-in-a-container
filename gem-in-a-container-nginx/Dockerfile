FROM nginx:1.9.9
MAINTAINER adam.v.duke@gmail.com

COPY nginx.conf /etc/nginx/nginx.conf
COPY geminabox.conf /etc/nginx/conf.d/geminabox.conf
RUN rm /etc/nginx/conf.d/default.conf
RUN mkdir -p /data/nginx/cache

EXPOSE 5000
