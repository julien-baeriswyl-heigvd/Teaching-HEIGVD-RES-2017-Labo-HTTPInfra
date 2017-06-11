FROM php:5.6-apache

MAINTAINER Julien Baeriswyl <julien.baeriswyl@heig-vd.ch>

COPY apache2-foreground /usr/local/bin/
COPY conf/ /etc/apache2/

# enable Apache2 modules
RUN a2enmod proxy proxy_balancer proxy_http proxy_connect lbmethod_byrequests lbmethod_bytraffic lbmethod_bybusyness lbmethod_heartbeat

# enable Apache2 sites
RUN a2ensite 000-* 001-*
