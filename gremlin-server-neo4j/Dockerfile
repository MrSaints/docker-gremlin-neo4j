FROM openjdk:8-alpine
MAINTAINER Ian Lai <os@fyianlai.com>

ARG GREMLIN_VERSION=3.2.1

RUN apk add --update bash && rm -rf /var/cache/apk/* && \
    wget -O /tmp/gremlin-server.zip http://mirror.catn.com/pub/apache/tinkerpop/$GREMLIN_VERSION/apache-gremlin-server-$GREMLIN_VERSION-bin.zip && \
    unzip /tmp/gremlin-server.zip -d / && \
    mv /apache-gremlin-server-$GREMLIN_VERSION/ /gremlin-server/ && \
    chmod +x /gremlin-server/bin/gremlin-server.sh && \
    rm /tmp/gremlin-server.zip

WORKDIR /gremlin-server/

COPY ./grapeConfig.xml /root/.groovy/grapeConfig.xml
RUN /bin/bash -c "/gremlin-server/bin/gremlin-server.sh -i org.apache.tinkerpop neo4j-gremlin $GREMLIN_VERSION"

COPY ./conf/gremlin-server-custom.yml /gremlin-server/conf/gremlin-server-custom.yml

CMD ["/bin/bash", "/gremlin-server/bin/gremlin-server.sh", "conf/gremlin-server-custom.yml"]
EXPOSE 8182