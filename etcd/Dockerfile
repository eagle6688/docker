FROM alpine

ADD run.sh /bin/run.sh

RUN apk add --update ca-certificates openssl tar \
    && tar -xzf etcd-v3.3.0-rc.2-linux-amd64.tar.gz -C /bin/ --strip-components=1 \
    && apk del --purge tar openssl \
    && rm -Rf etcd-v3.3.0-rc.2-linux-amd64.tar.gz /var/cache/apk/*

VOLUME /data

EXPOSE 2379 2380 4001 7001

ENTRYPOINT  ["/bin/run.sh"]