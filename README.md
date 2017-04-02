Packaging Virtualenv
============

Using the package `rpmvenv` we're creating an rpm with a Python 3.5 virtual env, and all code dependencies of our
example package `stupidbin`

The whole point here is to demonstrate how we could develop smoothly with python3 without fearing dependencies
and still have a pretty decent and simple packaging process.

The only OS dependency is the Python 3.5 itself and the OS must be the same. 

As long as our target machine have the same Python 3.5 the rpm will be installed sucessfully.

Of course, is still a `virtualenv` to use the packages we need to activate the virtualenv, but hey, this is not an issue, this is great because we're not obstructing the host, our code is completly isolated.

# Stupidbin

As the name may employ, Stupid bin is a stupid bin/module. The whole point
of this package is demonstrate how our dependencies are going to be tied together
in our rpm. To do that it needs to be a standard python package (setup.py, bin folder)
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

The container `consumer` is an target environment example. A simple centos7 with python 3.5.2 to demonstrate how simple is to install our rpm and execute our script `stupidbin`.

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