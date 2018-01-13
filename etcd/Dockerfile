FROM alpine

ENV InstallFile="etcd-v3.3.0-rc.2-linux-amd64.tar.gz"

COPY $InstallFile run.sh ./

RUN apk add --update ca-certificates openssl tar \
    && tar -xzf $InstallFile -C /bin/ --strip-components=1 \
    && mv run.sh /bin/ \
    && apk del --purge tar openssl \
    && rm -Rf $InstallFile /var/cache/apk/*

VOLUME /data

EXPOSE 2379 2380 4001 7001

ENTRYPOINT  ["/bin/run.sh"]