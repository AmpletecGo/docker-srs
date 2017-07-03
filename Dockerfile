FROM centos:7

RUN yum -y update && \
    yum -y install unzip gcc gcc-c++ make patch pcre-devel automake libtool zlib-devel sudo net-tools expect && \
    cd /tmp && \
    curl -L -o 3.0release.zip https://github.com/ossrs/srs/archive/3.0release.zip && \
    unzip 3.0release.zip && \
    cd srs-3.0release/trunk && \
    ./configure --full && \
    make && \
    make install && \
	cd /tmp && \
    rm -rf * && \
	yum -y erase unzip gcc gcc-c++ make patch pcre-devel automake libtool zlib-devel sudo net-tools && \
	yum -y autoremove && \
    yum -y clean all

EXPOSE 1935 1985 8080
COPY srs.conf /usr/local/srs/conf/docker.conf
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
