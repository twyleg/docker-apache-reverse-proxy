FROM httpd:latest

LABEL description="Personal apache2 reverse proxy with certbot"
MAINTAINER Torsten Wylegala <mail@twyleg.de>

RUN apt-get update && \
    apt-get install -y \ 
	cron \
	certbot \
	python3-certbot-apache && \
    rm -rf /var/lib/apt/lists/* 

RUN a2enmod \
	ssl \
    	proxy \
    	proxy_http \
    	rewrite \
    	headers

EXPOSE 80
EXPOSE 443

# Configure Postfix on startup
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD ["/usr/bin/tail","-f","/var/log/apache2/error.log","/var/log/letsencrypt/letsencrypt.log"]
