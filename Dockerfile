# syntax=docker/dockerfile:1.4
FROM nginx:1.23

COPY <<EOF /usr/share/nginx/html/index.html
<h1>Hello!</h1>
EOF
