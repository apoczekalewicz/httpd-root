FROM centos:7

RUN yum -y install httpd php && yum clean all 


WORKDIR /var/www/html
COPY index.php script.sh ./

RUN find -L /run/httpd /etc/httpd /var/www/html -exec chown -R 1001:0 {} \; -exec chmod -R g+rwX {} \;

EXPOSE 80
CMD ["httpd", "-DFOREGROUND"]
