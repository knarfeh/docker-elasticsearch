FROM elasticsearch:2.4.0

MAINTAINER knarfeh@outlook.com

ENV KIBANA_VERSION 4.6.4

RUN cd /tmp && \
    wget -nv https://download.elastic.co/kibana/kibana/kibana-${KIBANA_VERSION}-linux-x86_64.tar.gz && \
    tar zxf kibana-${KIBANA_VERSION}-linux-x86_64.tar.gz && \
    rm -f kibana-${KIBANA_VERSION}-linux-x86_64.tar.gz && \
    mv /tmp/kibana-${KIBANA_VERSION}-linux-x86_64 /kibana

RUN /kibana/bin/kibana plugin --install elastic/sense

COPY docker-entrypoint.sh /

CMD ["elasticsearch"]
