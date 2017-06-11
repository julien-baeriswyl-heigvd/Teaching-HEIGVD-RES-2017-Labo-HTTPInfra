FROM php:5.6-apache

MAINTAINER Julien Baeriswyl <julien.baeriswyl@heig-vd.ch>

# copy some scripts to run Apache Load Balancer
#COPY scripts/start-lb.sh /start-lb.sh
#COPY scripts/lb-worker.sh /lb-worker.sh

COPY apache2-foreground /usr/local/bin/
COPY templates/ /var/apache2/templates
COPY conf/ /etc/apache2/

# enable Apache2 modules
RUN a2enmod proxy proxy_balancer proxy_http proxy_connect lbmethod_bybusyness lbmethod_byrequests

# enable Apache2 sites
RUN a2ensite 000-* 001-*

# copy the config files for the load balancer
#COPY lb-conf/ports.conf          /etc/apache2/
#COPY lb-conf/proxy.conf          /etc/apache2/mods-available/
#COPY lb-conf/proxy_balancer.conf /etc/apache2/mods-available/

### Apache ports
# 8080: default website

#EXPOSE 8080

# by default, this container is a Spark Worker
#CMD ["/start-lb.sh"]
