FROM php:5.6-apache

MAINTAINER Julien Baeriswyl <julien.baeriswyl@heig-vd.ch>

COPY apache2-foreground /usr/local/bin/
COPY templates/ /var/apache2/templates
COPY conf/ /etc/apache2/

RUN a2enmod proxy proxy_http
RUN a2ensite 000-* 001-*
