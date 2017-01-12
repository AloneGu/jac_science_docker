FROM ubuntu:14.04
MAINTAINER jackling


RUN DEBIAN_FRONTEND=noninteractive

# copy source list
ADD apt.list /etc/apt/sources.list
RUN cat /etc/apt/sources.list

# Update apt-get local index
RUN apt-get -qq update

# install pip
RUN apt-get -y install python-pip

# python lib
RUN apt-get -y --force-yes install python-numpy python-scipy python-pandas python-matplotlib python-sklearn libmysqld-dev

RUN pip install xgboost==0.6a2
RUN pip install Flask
RUN pip install arrow
RUN easy_install mysql-python