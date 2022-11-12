# Larapack-9x
Quick start create package laravel

## Installation
```bash
# Clone git repository
$ git clone https://github.com/darkjinnee/larapack-9x.git

# Go project directory
$ cd ./larapack-9x

# Copy environment variables
$ cp .env.example .env

# Build images and run containers
$ docker-compose up --build -d
```

### Add lines `hosts` file
```text
...
127.0.0.1 larapack-9x.loc www.larapack-9x.loc
```

## Usage
```bash
# Commands: start, restart, stop
$ docker-compose <command>

# Enter container shell
$ docker-compose exec <service> bash

# Show logs containers
$ docker-compose logs -f

# Stop and remove containers, networks, images, and volumes
$ docker-compose down --rmi=all
```

### Migrate and Seeding
```bash
# Enter container shell
$ docker-compose exec php bash

# Migrate and seeding
$ php artisan migrate --seed
```

### Dev user for PHP service
```bash
$ su dev
```

### Package management
To create packages see the documentation for [laravel-packager](https://github.com/Jeroen-G/laravel-packager)

### Xdebug
To activate Xdebug edit file docker/services/php/conf.d/xdebug.ini, remote host must be your local IP address
***
Multiple domains with [nginx-proxy](https://github.com/nginx-proxy/nginx-proxy "nginx-proxy")
