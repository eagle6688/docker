FROM eagle6688/tomcat
LABEL author=Aldwin

ENV WebsiteWarFile="devutility.test.springmvc.war" \
    WebsitePath=/home/website

COPY $WebsiteWarFile ./

RUN mv -f $WebsiteWarFile $WebsitePath