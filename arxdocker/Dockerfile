FROM lsiobase/ubuntu:jammy
MAINTAINER Ryan Flagler



# pull installer
RUN     mkdir -p /app

WORKDIR /app

# Set noninteractive
RUN     echo "debconf debconf/frontend select noninteractive" | debconf-set-selections

# install packages
RUN     apt-get update && \
        apt-get install --no-install-recommends --yes \      
        apt-get clean && \
        apt-get autoremove --purge && \
        rm -rf \
                /opt/deb \
                /tmp/* \
                /var/lib/apt/lists/* \
                /var/tmp/*

# add local files
COPY . /app_tmp

RUN apt-get install openjdk8-jre && chmod +x /app_tmp/arx_start.sh

CMD /bin/sh /app_tmp/arx_start.sh

VOLUME /config /archive