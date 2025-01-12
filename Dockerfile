# Base image
FROM fedora

# Labels for metadata
LABEL description="Dockerfile to containerize the slick app"
LABEL maintainer="Andre DIBI"

# Update and install Apache HTTP Server
RUN apt update -y && apt install -y httpd

# Copy the index file to the container
COPY ./Jenkins-project /var/www/html/

# Expose port 80 for web traffic
EXPOSE 80

# Start the Apache HTTP server in the foreground
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
