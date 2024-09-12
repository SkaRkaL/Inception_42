# Use the official Debian bullseye as the base image
FROM debian:bullseye

# Update and upgrade the system, then install required packages in one step
RUN apt update && apt upgrade -y && apt install -y \
    curl \
    php \
    php-fpm \
    php-mysql \
    mariadb-client \
    wget

# Set the working directory to /var/www
WORKDIR /var/www

# Download WordPress to the /var/www directory
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

# Extract WordPress and remove the tar file to save space
RUN tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

# Copy the auto configuration script into the root directory

RUN mkdir -p /run/php /var/run/php && \
chown www-data:www-data /run/php /var/run/php

COPY conf/auto_config.sh /


# Make the auto configuration script executable
RUN chmod +x /auto_config.sh

# Set the working directory to the WordPress installation
WORKDIR /var/www/wordpress

# Run the auto configuration script when the container starts
CMD ["/auto_config.sh"]
