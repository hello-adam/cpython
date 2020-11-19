#!/bin/sh
yum update -y

yum install -y \
    zlib-devel \
    xz-devel \
    ncurses-devel \
    readline-devel \
    sqlite-devel \
    openssl-devel \
    gdbm-devel \
    libffi-devel \
    uuid-devel

if [ ! -z "$1" ]
then
  echo ##vso[task.prependpath]$PWD/multissl/openssl/$1
  echo ##vso[task.setvariable variable=OPENSSL_DIR]$PWD/multissl/openssl/$1
  python3 Tools/ssl/multissltests.py --steps=library --base-directory $PWD/multissl --openssl $1 --system Linux
fi
