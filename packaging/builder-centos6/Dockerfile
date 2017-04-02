FROM centos:6.8

RUN yum -y install epel-release rpm-build gcc make zlib-devel openssl-devel

ADD Python-3.5.2.tgz /tmp/

WORKDIR /tmp/Python-3.5.2

RUN ./configure --with-zlib ; make install

RUN pip3.5 install rpmvenv virtualenv