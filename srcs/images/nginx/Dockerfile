FROM debian:bookworm

# Install Nginx
RUN apt-get update && apt-get install -y nginx openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/cert.crt \
       -keyout /etc/nginx/cert.key \
       -subj "/CN=miahmadi/"

# Copy Nginx configuration file to the container
COPY nginx.conf /etc/nginx/config.d

# Expose port 80 to the host
EXPOSE 80
EXPOSE 443

# Start Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]