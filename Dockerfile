FROM centos:7

RUN yum -y update && \
    yum -y install expect unzip redhat-lsb && \
    cd /tmp && \
    curl -o SRS-CentOS6-x86_64-2.0.243.zip http://www.ossrs.net/srs.release/releases/files/SRS-CentOS6-x86_64-2.0.243.zip && \
    unzip SRS-CentOS6-x86_64-2.0.243.zip && \
    cd SRS-CentOS6-x86_64-2.0.243 && \
    ./INSTALL && \
	cd /tmp && \
    rm -rf * && \
	yum -y remove unzip redhat-lsb && \
#	yum -y autoremove && \
    yum -y clean all

EXPOSE 1935 1985 8080
COPY srs.conf /usr/local/srs/conf/docker.conf
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
