FROM centos:7

RUN yum -y install epel-release rpm-build gcc make zlib-devel openssl-devel

ADD Python-3.5.3.tar.xz /tmp/

WORKDIR /tmp/Python-3.5.3

RUN mkdir /apps ;\
./configure --prefix="/apps/python-3.5.3" --enable-shared ;\
LD_RUN_PATH="/apps/python-3.5.3/lib" make install -j 8

RUN /apps/python-3.5.3/bin/pip3 install rpmvenv virtualenv

ENV PATH /apps/python-3.5.3/bin:$PATH