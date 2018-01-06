FROM centos
LABEL author=Aldwin

ENV JDKFile="server-jre-8u152-linux-x64.tar.gz" \
    JAVA_HOME=/usr/src/java

COPY $JDKFile ./

RUN mkdir -p $JAVA_HOME \
    && tar -xzf $JDKFile -C $JAVA_HOME --strip-components=1 \
    && rm -rf $JDKFile

EXPOSE 80