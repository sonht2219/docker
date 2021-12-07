filename=".env"
if [ -n "$1" ]
    then 
        sed -i '' "s/PHP_VERSION=[0-9.]*/PHP_VERSION=$1/" "$filename"
        docker-compose stop
        docker-compose build --no-cache php-fpm workspace
fi
docker-compose up -d nginx mariadb php-fpm workspace phpmyadmin redis
