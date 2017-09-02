FROM tomcat:alpine

ENV FPC_VERSION="3.0.2" \
    FPC_ARCH="x86_64-linux"

RUN apk add --no-cache --virtual .native-build-deps sudo git rsync apache-ant gcc g++ python3 mysql-client \
    && adduser -D -u 1000 zero \
    && cd /tmp \
    && wget "ftp://ftp.hu.freepascal.org/pub/fpc/dist/${FPC_VERSION}/${FPC_ARCH}/fpc-${FPC_VERSION}.${FPC_ARCH}.tar" -O fpc.tar \
    && tar xf "fpc.tar" \
    && cd "fpc-${FPC_VERSION}.${FPC_ARCH}" \
    && rm demo* doc* \
    && mkdir /lib64 \
    && ln -s /lib/ld-musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2 \
    && echo -e '/usr\nN\nN\nN\n' | sh ./install.sh \
    && find "/usr/lib/fpc/${FPC_VERSION}/units/${FPC_ARCH}/" -type d -mindepth 1 -maxdepth 1 \
        -not -name 'fcl-base' \
        -not -name 'rtl' \
        -not -name 'rtl-console' \
        -not -name 'rtl-objpas' \
        -exec rm -r {} \; \
    && rm -r "/lib64" "/tmp/"*

COPY ROOT.war /usr/local/tomcat/webapps/
COPY ZeroJudge_Server.war /usr/local/tomcat/webapps/
COPY zerojudge.sql /root

EXPOSE 80 8080
