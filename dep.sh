#!/bin/sh

## Constants
readonly PIP="9.0.3"
readonly ANSIBLE="2.7"

yum install -y epel-release git 
yum install -y python2-pip

python -m pip install --disable-pip-version-check --upgrade --force-reinstall \
    pip==${PIP}
python -m pip install --disable-pip-version-check --upgrade --force-reinstall \
    setuptools
python -m pip install --disable-pip-version-check --upgrade --force-reinstall \
    pyOpenSSL \
    requests \
    netaddr \
    jmespath \
    ansible==${1-${ANSIBLE}}