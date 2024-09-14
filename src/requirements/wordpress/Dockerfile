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
# Copy the auto configuration script into the root directory

COPY conf/auto_config.sh /

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
# Make the auto configuration script executable
RUN chmod +x /auto_config.sh
WORKDIR /var/www/wordpress
RUN mkdir -p /run/php
# Run the auto configuration script when the container starts
ENTRYPOINT [ "bash", "/auto_config.sh" ]

CMD ["php-fpm7.4", "-F"]
