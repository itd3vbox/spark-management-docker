FROM debian:bookworm

# Update packages and install nginx, openssl, curl, Node.js
RUN apt-get update && \
    apt-get install -y nginx openssl curl && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    apt-get clean

# RUN mkdir -p /etc/nginx/ssl && \
#     openssl req -x509 -nodes -days 365 \
#         -subj "/C=US/ST=State/L=City/O=Organization/OU=OrgUnit/CN=camagru.demo" \
#         -newkey rsa:2048 -keyout /etc/nginx/ssl/in.key \
#         -out /etc/nginx/ssl/in.crt

# Copy main nginx configuration
COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# COPY ./conf/sparkmanagement.crt /etc/nginx/ssl/sparkmanagement.crt
# COPY ./conf/sparkmanagement.key /etc/nginx/ssl/sparkmanagement.key

# Copy site configuration for Spark Management demo
COPY ./conf/demo.sparkmanagement.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/demo.sparkmanagement.conf /etc/nginx/sites-enabled/

# Copy phpMyAdmin site configuration
COPY ./conf/phpmyadmin.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/phpmyadmin.conf /etc/nginx/sites-enabled/

COPY ./conf/demo.phpmyadmin.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/demo.phpmyadmin.conf /etc/nginx/sites-enabled/

# Create directories for phpMyAdmin and download/install it via curl
RUN mkdir -p /usr/share/phpmyadmin && \
    curl -L https://files.phpmyadmin.net/phpMyAdmin/4.9.7/phpMyAdmin-4.9.7-all-languages.tar.gz | tar xz --strip-components=1 -C /usr/share/phpmyadmin && \
    ln -s /usr/share/phpmyadmin /var/www/phpmyadmin

# Copy your custom phpMyAdmin configuration file
COPY ./conf/config.inc.php /usr/share/phpmyadmin/config.inc.php

# Expose HTTP and HTTPS ports
EXPOSE 80 443

# Start nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]