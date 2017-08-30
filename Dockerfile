FROM tomcat
MAINTAINER Hong-Da, Ke 

COPY ROOT.war /var/lib/tomcat8/webapps/
COPY ZeroJudge_Server.war /var/lib/tomcat8/webapps/


RUN apt-get update \
    && apt-get install lxc libvirt-bin bridge-utils cgroup-bin \
    &&  \
    && 

COPY zerojudge.sql /root

RUN mysql -u root -p zerojudge < /root/zerojudge.sql 


EXPOSE 80 8080

WORKDIR /root/pxt-microbit

ENTRYPOINT ["pxt", "serve", "-h", "0.0.0.0", "-p", "80","--noBrowser"]
