FROM alpine:latest
WORKDIR /app
COPY . /app_tmp
RUN apk add --no-cache openjdk8-jre && apk add --no-cache wget && chmod +x /app_tmp/arx_start.sh

RUN wget https://github.com/btstromberg/docker/releases/download/arx_4.0_docker/arx.tar.gz -P /app_tmp/

RUN cd /app_tmp/ && tar -xzf arx.tar.gz && rm arx.tar.gz && cd /app

CMD /bin/sh /app_tmp/arx_start.sh
