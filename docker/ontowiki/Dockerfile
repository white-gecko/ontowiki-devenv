FROM ubuntu:14.04

RUN apt-get update \
 && apt-get install -y git php5-cli make curl \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# clone ontowiki and get its dependencies
RUN git clone https://github.com/AKSW/OntoWiki.git /var/www/
RUN cd /var/www/ && make deploy
RUN cp /var/www/config.ini.dist /var/www/config.ini

VOLUME /var/www/
