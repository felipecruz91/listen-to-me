# syntax=docker/dockerfile:1.4
FROM php:7.4.30-apache-buster

COPY <<EOF /var/www/html/index.php
<?php
echo "Hello World from Docker!";
?>
EOF

EXPOSE 80
ENTRYPOINT ["php", "-S", "0.0.0.0:80", "-t", "/var/www/html"]
