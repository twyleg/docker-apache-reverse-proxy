# Apache reverse proxy

Docker image based on the official httpd (apache) image  to provide a simple reverse proxy with integrated certbot.

## Letsencrypt/Certbot

Certbot runs with the apache plugin and therefore determines all necessary information from the apache config.
Certbot comes with a cron script that ensures that certbot is run twice daily to renew certificates.
