#!/bin/bash

# Configure permissions on mounted directories
chown -R www-data:www-data /var/www/project-manager-laravel
chmod -R 775 /var/www/project-manager-laravel

# Configure permissions for log files
mkdir -p /var/log/php
chown -R www-data:www-data /var/log/php

# Execute the default command
exec "$@"
