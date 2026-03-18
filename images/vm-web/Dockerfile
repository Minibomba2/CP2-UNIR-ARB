FROM nginx:alpine

RUN apk add --no-cache openssl apache2-utils
RUN mkdir -p /etc/nginx/certs /etc/nginx/auth /usr/share/nginx/html

COPY index.html /usr/share/nginx/html/index.html
COPY nginx.conf /etc/nginx/nginx.conf

RUN htpasswd -bc /etc/nginx/auth/.htpasswd cp2user cp2pass

RUN openssl req -x509 -nodes -days 365 \
  -subj "/CN=vm-cp2" \
  -newkey rsa:2048 \
  -keyout /etc/nginx/certs/tls.key \
  -out /etc/nginx/certs/tls.crt

EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
