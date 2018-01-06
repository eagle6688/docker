FROM eagle6688/tomcat
LABEL author=Aldwin

ENV War_File=devutility.test.springmvc.war \
    Website_Root=/home/website/ \
    JAVA_HOME=/usr/local/java \
    PATH=$PATH:$JAVA_HOME/bin

ADD $War_File $Website_Root

RUN cd $Website_Root \
    && jar -xvf $War_File \
    && rm -rf $War_File