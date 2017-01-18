
run it like so:

```
docker run -t -i -p 80:80 -e SRV_NAME="meinserver.de" roundcube
```

you could mount: `/var/www/html/logs/`


env variables:

SRV_NAME="meinserver.de"
DB_USR="root"
DB_PW="dbpw"
DB_HOST="mysql"
IMAP_SRV="imap.meinserver.de"
SMTP_SRV="smtp.meinserver.de"
SUPP_URL="support.meinserver.de"
MAIL_NAME="Mein cooler Server"
LANG="de_DE"