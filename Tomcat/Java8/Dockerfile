FROM centos

ENV JDKFile="server-jre-8u152-linux-x64.tar.gz" \
    TomcatFile="apache-tomcat-9.0.2.tar.gz" \
    TomcatConfigFile="server.xml" \
    WebsitePath=/home/website \
    JAVA_HOME=/usr/local/java \
    CLASSPATH=$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar \
    CATALINA_HOME=/usr/local/tomcat \
    PATH=$PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin

COPY $JDKFile $TomcatFile $TomcatConfigFile ./

RUN mkdir -p $JAVA_HOME \
    && tar -xzf $JDKFile -C $JAVA_HOME --strip-components=1 \
    && rm -rf $JDKFile \
    && mkdir -p $CATALINA_HOME \
    && tar -xzf $TomcatFile -C $CATALINA_HOME --strip-components=1 \
    && rm -rf $TomcatFile \
    && mkdir -p $WebsitePath \
    && cp -f $TomcatConfigFile $CATALINA_HOME/conf \
    && rm -rf $TomcatConfigFile

EXPOSE 80

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"] && tail -f /usr/local/tomcat/logs/catalina.out