FROM debian:bookworm

RUN apt-get update && apt-get install -y nginx openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/cert.key -out /etc/nginx/ssl/cert.crt -subj "/CN=localhost"

COPY nginx.conf /etc/nginx/sites-enabled/
COPY nginx.conf /etc/nginx/config.d

EXPOSE 80
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]