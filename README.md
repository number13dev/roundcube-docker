
run it like so:

```
docker run -t -i \
    -p 80:80 \
    -e SRV_NAME="meinserver.de" \
    -e DB_USR="root" \
    -e DB_PW="dbpw" \
    -e DB_HOST="mysql" \
    -e IMAP_SRV="imap.example.com" \
    -e SMTP_SRV="smtp.mexample.com" \
    -e SUPP_URL="support.example.com" \
    -e MAIL_NAME="My Example Roundcube" \
    roundcube
```

you could mount: `/var/www/html/logs/`

```
-v roundcube-logs:/var/www/html/logs/
```


ENV variables:

SRV_NAME="example.com"
DB_USR="root"
DB_PW="dbpw"
DB_HOST="mysql"
IMAP_SRV="imap.example.com"
SMTP_SRV="smtp.mexample.com"
SUPP_URL="support.example.com"
MAIL_NAME="My Example Roundcube"
LANG="de_DE"
RC_TIMEZONE="Europe/Berlin"

