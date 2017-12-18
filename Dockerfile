FROM centos:7

ENV SRS_VERSION="2.0.239"

RUN yum -y update && \
    yum -y install unzip gcc gcc-c++ make patch pcre-devel automake libtool zlib-devel sudo net-tools expect && \
    cd /tmp && \
    curl -L -o SRS-CentOS6-x86_64-${SRS_VERSION}.zip http://ossrs.net/srs.release/releases/files/SRS-CentOS6-x86_64-${SRS_VERSION}.zip && \
    unzip -q SRS*.zip && cd SRS* && sudo bash INSTALL && \
    cd /tmp && \
    rm -rf * && \
    yum -y erase unzip gcc gcc-c++ make patch pcre-devel automake libtool zlib-devel sudo net-tools && \
    yum -y autoremove && \
    yum -y clean all

EXPOSE 1935
COPY srs.conf /usr/local/srs/conf/srs.conf
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
