FROM mongo:5.0.8

LABEL website="sangchul.kr"

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=Asia/Seoul

RUN echo $TZ > /etc/timezone

RUN apt update \
  && apt install -qq -y aptitude sudo vim curl \
    net-tools iputils-ping traceroute netcat telnet dnsutils \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /data/key \
  && openssl rand -base64 756 > /data/key/mongo.key

RUN chown -R mongodb:mongodb /data/key/mongo.key \
  && chmod 400 /data/key/mongo.key

### docker build
# docker build -t anti1346/mongo:5.0.8 .
# docker push anti1346/mongo:5.0.8 .
