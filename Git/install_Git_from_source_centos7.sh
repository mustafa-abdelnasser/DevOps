#!/bin/bash

GIT_VERSION="2.35.3"

# all versions mirror
#https://mirrors.edge.kernel.org/pub/software/scm/git/

# install dnf
sudo yum -y install dnf

# Add the EPEL repository
sudo dnf -y install \
  https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

# Install the build dependencies
sudo dnf -y install asciidoc curl-devel dh-autoreconf docbook2X expat-devel \
  gettext-devel openssl-devel perl-devel xmlto zlib-devel gcc

# Account the different name of an executable on RPM-based distributions
sudo ln -s /usr/bin/db2x_docbook2texi /usr/bin/docbook2x-texi

# download and extract tar file
wget https://mirrors.edge.kernel.org/pub/software/scm/git/git-${GIT_VERSION}.tar.gz
tar -zxf git-${GIT_VERSION}.tar.gz
cd git-${GIT_VERSION}

# Build the configure script
make configure

# Configure the buil
./configure --prefix=/usr

# Build Git
make all doc info

# System wide Git install
sudo make install install-doc install-html install-info

# clean up
cd ..
rm -rf git-${GIT_VERSION} git-${GIT_VERSION}.tar.gz