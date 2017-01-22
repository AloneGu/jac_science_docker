FROM ubuntu:14.04
MAINTAINER jackling


RUN DEBIAN_FRONTEND=noninteractive

# copy source list
ADD apt.list /etc/apt/sources.list
RUN cat /etc/apt/sources.list

# Update apt-get local index
RUN apt-get -qq update

# install pip
RUN apt-get -y install python-pip python-dev libxml2-dev libxslt-dev python-lxml libblas-dev liblapack-dev libatlas-base-dev gfortran

# python lib
RUN apt-get -y --force-yes install python-mysqldb
RUN pip install numpy==1.11.1
RUN pip install pandas==0.18.1
RUN easy_install lxml
RUN easy_install scipy==0.18.1
RUN easy_install scikit-learn==0.18.1
RUN pip install xgboost==0.6a2
RUN pip install Flask
RUN pip install arrow

