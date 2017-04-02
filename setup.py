#!/usr/bin/env python
from setuptools import setup

setup(
    name='stupidbin',
    version='0.1',
    description='The dumbest package on earth',
    author='Bernardo Vale',
    author_email='bernardosilveiravale@gmail.com',
    packages=['stupidbin'],
    install_requires=['setuptools', 'requests'],
    scripts=['bin/stupidbin'],
)
