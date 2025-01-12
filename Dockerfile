#Base image
FROM ubuntu:20.04

# Description
LABEL description="Dockerfile to containerize the slick application"
 
# Update all packages
RUN apt-get -y update
 
# Install Apache on Ubuntu
RUN apt-get install apache2 -y
 
# Copy web app from local to the container
COPY ./webapp/ /var/www/html
 
# Port on which the app should listen
EXPOSE 80
 
# Start Apache2 and make it run in the foreground
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
 