FROM nginx
MAINTAINER Amane Katagiri

RUN mkdir /data
ADD default.conf /etc/nginx/conf.d/default.conf
ADD image-list.xslt /etc/nginx/image-list.xslt

EXPOSE 80
CMD ["/usr/sbin/nginx", "-g", "daemon off; load_module /etc/nginx/modules/ngx_http_xslt_filter_module.so;"]
