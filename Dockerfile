FROM tomcat
MAINTAINER Hong-Da, Ke 

COPY ROOT.war /var/lib/tomcat8/webapps/
COPY ZeroJudge_Server.war /var/lib/tomcat8/webapps/
COPY zerojudge.sql /root

RUN apt-get update \
    && apt-get install lxc libvirt-bin bridge-utils cgroup-bin \
    &&  \
    && 

EXPOSE 80 3233

WORKDIR /root/pxt-microbit

ENTRYPOINT ["pxt", "serve", "-h", "0.0.0.0", "-p", "80","--noBrowser"]
