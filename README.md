Packaging Virtualenv
====================
This is a simple example of how we can package a Python 3.5 virtualenv
containing a simple project `stupidbin` that has external PyPi dependencies inside a single `rpm` file.

To do that we use the amazing python package [`rpmvenv`](https://github.com/kevinconway/rpmvenv) 

The whole point here is to demonstrate how we could develop smoothly python3 
code, without fearing dependencies and still have a pretty decent packaging process.


# What we need

With this approach the resulting `rpm` will be strict dependent to the build environment. 

If we build inside a CentOS 6 with Python 3.5 the only machines able to install it will be exactly CentOS6 with Python 3.5.

Also, the package is still a `virtualenv`. To use it we need to activate the virtualenv, but hey, 
this is not an issue, this is great because we're installing things in a non intrusive way.

We'e not obstructing the host, our code is completely isolated!


# Stupidbin

As the name may imply, Stupid bin is a stupid bin/module. The whole point of this package 
is demonstrate how our dependencies are going to be tied together in our rpm. 

To do that it needs to be a standard python package (setup.py, bin folder)
with at least one external dependency (I've choose `requests` for this demo).

Getting Started
===============

First we gotta build the container that will be used to execute `rpmvenv`

Download a fresh copy of Python 3.5 and place it inside this folder:

wget https://www.python.org/ftp/python/3.5.2/Python-3.5.2.tgz

Build the container (Python tgz will be pushed to the container during the
build phase):
```
make builder
```

Now we're ready to generate the rpm:
```
make rpm
```

# Consumer

The container `consumer` is an target environment example. 
A simple centos7 with python 3.5.2 to demonstrate how simple is to install our rpm and execute our script `stupidbin`.

## Running Consumer

Build the consumer first:
```
make consumer
```


Start the container and install the rpm:
```
docker run -it --rm -v $PWD:/tmp/rpm centos35 bash
cd /tmp/rpm
rpm -ivh stupidbin-0.1-1.x86_64.rpm
```

Activate the virtualenv:
```
source /usr/share/python/stupidbin/bin/activate
```

Execute `stupidbin` to test:
```
stupidbin
```