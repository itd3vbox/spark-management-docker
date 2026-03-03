# Spark Management - DOCKER

Docker environment for Spark Management, including Laravel, MariaDB database, phpMyAdmin, and automation scripts support.
This repository provides a complete local development environment using Docker containers.

## Environment Variables

Before starting the Docker environment, make sure to review and configure the .env file according to your local setup.

Update:

- Database credentials
- Project paths (SM_LARAVEL, etc.)
- Any other environment-specific configuration

⚠️ Make sure all paths are absolute paths.

Paths Description
- SM_LARAVEL → Path to the Laravel project
- SM_DB → Directory where MySQL/MariaDB data will be stored
- SM_AUTOMATES → Directory where automation scripts will be stored and executed by the application
- SM_SMA → Directory for phpMyAdmin configuration

Use absolute paths. You can run pwd to get your current directory.

## Build Instructions

**Step 1 : Download Required Projects**

Clone the following repository:
  - [spark-management-laravel](https://github.com/itd3vbox/spark-management-laravel)

**Step 2 : Create Required Folders**

Create the following empty directories:
  - spark-management-automates
    → This folder will contain automation scripts executed by the application.
  - spark-management-db
    → This folder will store the SQL database data.
  - spark-management-phpmyadmin
    → This folder is used for phpMyAdmin.

**Step 3 : Update Your Hosts File**

Add the following line to your /etc/hosts file:
```
127.0.0.1   sparkmanagement.demo
```

**Step 4 : Build and Start Docker**

Make sure Docker is installed.
Then run:
```
cd spark-management-docker
cd www-debian
make clean
make
```

**Step 5 : Install Laravel Dependencies**

1. Open Docker Desktop
2. Go to Containers
3. Select the container named www-web
4. Open the Exec tab and run:


```
bash
cd /var/www/spark-management-laravel/
composer install
php artisan clean:data
php artisan migrate:fresh --seed
php artisan storage:link
```

1. Open Docker Desktop
2. Go to Containers
1. Select the container named www-nginx
2. Open the Exec tab and run:

**Step 6: Access the Application** 

```
bash
cd /var/www/spark-management-laravel/
npm install
npm run dev
```

Once all containers are running, open your browser and go to:
```
http://sparkmanagement.demo/
```
You can log in with the following credentials:
- Email: user1@sm.demo
- Password: 123456

## Useful Commands

**PHP Configuration**

```
php -i
php -i | grep 'Loaded Configuration File'
php -i | grep 'upload_max_filesize'
php -i | grep 'post_max_size'
```

**Docker Cleanup**

Remove unused Docker containers, images, networks, and volumes:

```
docker system prune -a
```