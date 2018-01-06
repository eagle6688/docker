FROM centos
LABEL author=Aldwin

ENV JDKFile="server-jre-8u152-linux-x64.tar.gz" \
    TomcatFile="apache-tomcat-9.0.2.tar.gz" \
    JAVA_HOME=/usr/src/java \
    CLASSPATH=$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar \
    CATALINA_HOME=/usr/src/tomcat \
    PATH=$PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin

COPY $JDKFile $TomcatFile ./

RUN mkdir -p $JAVA_HOME \
    && tar -xzf $JDKFile -C $JAVA_HOME --strip-components=1 \
    && rm -rf $JDKFile \
    && mkdir -p $CATALINA_HOME \
    && tar -xzf $TomcatFile -C $CATALINA_HOME --strip-components=1 \
    && rm -rf $TomcatFile

EXPOSE 8080

CMD ["/usr/src/tomcat/bin/catalina.sh", "run"] && tail -f /usr/src/tomcat/logs/catalina.out