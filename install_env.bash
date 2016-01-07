#!/usr/bin/env bash

# Install NEST environment with some more facilities (vim, git, etc.)

export DEBIAN_FRONTEND=noninteractive

apt update
apt upgrade -y
until apt install -y git-all git vim openmpi-bin openmpi-common build-essential autoconf automake libtool libltdl7-dev \
    libreadline6-dev libncurses5-dev libgsl0-dev python-all-dev python-numpy python-scipy python-matplotlib \
    cython ipython
do
    echo "Retry apt 1"
    sleep 1
done
apt update
until apt install -y libopenmpi-dev
do
    echo "Retry apt 2"
    sleep 1
done
apt install --fix-missing
