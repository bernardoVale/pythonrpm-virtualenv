FROM centos:7

RUN yum -y install epel-release gcc make zlib-devel openssl-devel

ADD Python-3.5.2.tgz /tmp/

WORKDIR /tmp/Python-3.5.2

RUN ./configure --with-zlib ; make install