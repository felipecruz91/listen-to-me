# syntax=docker/dockerfile:1.4
FROM cgr.dev/chainguard/nginx

COPY <<EOF /usr/share/nginx/html/index.html
<h1>Hello 2!</h1>
EOF
