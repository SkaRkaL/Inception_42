FROM debian:bullseye

# Update package lists, upgrade installed packages, and install necessary packages
RUN apt update && apt upgrade -y && apt install -y nginx openssl

# Create SSL directory and generate self-signed certificate
RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout \
    /etc/nginx/ssl/inception.key -subj "/C=MO/ST=KH/L=KH/O=1337/OU=1337/CN=sakarkal.42.fr/UID=sakarkal"

# Copy nginx configuration file
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Create WordPress directory and set permissions
RUN mkdir -p /var/www/wordpress && \
    chown -R www-data:www-data /var/www/wordpress

# Expose port 80
EXPOSE 80

# Start nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
