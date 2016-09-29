#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

FROM ubuntu:15.04

# Install.
#RUN \
#  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
#  apt-get update && \
#  apt-get -y upgrade && \
#  apt-get install -y build-essential && \
#  apt-get install -y software-properties-common && \
#  apt-get install -y byobu curl git htop man unzip vim wget && \
#  rm -rf /var/lib/apt/lists/*

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]

ENV DEBIAN_FRONTEND noninteractive

# Install Nginx.
RUN \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y nginx && \
  rm -rf /var/lib/apt/lists/* && \
  chown -R www-data:www-data /var/lib/nginx

# Define mountable directories.
VOLUME ["/etc/nginx/certs", "/var/log/nginx", "/var/www/html"]

# Define working directory.
WORKDIR /etc/nginx

COPY nginx.conf /etc/nginx/nginx.conf
CMD nginx
