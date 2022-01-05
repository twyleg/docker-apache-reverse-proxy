#!/bin/bash

/etc/init.d/apache2 start
/etc/init.d/cron start

# Trigger certbot manually for the first time
# This will create /etc/letsencrypt/renewal/<DOMAIN>.conf which will be used for the auto renew process
# Auto renew is triggered twice a day by cron
certbot renew -n --apache

exec "$@"
