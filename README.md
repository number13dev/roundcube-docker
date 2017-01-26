# roundcube-docker
Roundcube Docker container with Password Addon

to run:

```
docker run -t -i \
    -p 80:80 \
    -e SRV_NAME="example.com" \
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
-v ~/roundcube-logs:/var/www/html/logs/
```

##### ENV variables:

* SRV_NAME="example.com"
 * Your Hostname where your Roundcube will be available.
* DB_USR="roundcube"
 * Your Database user
* DB_PW="roundcube-user-pw"
 * Your Database Password
* DB_HOST="db"
 * Your Database Host
* DB_ROOT_PW="my-secret-pw"
 * Your Database root password
* IMAP_SRV="imap.example.com"
 * the IMAP Server your Roundcube will connect to
* SMTP_SRV="smtp.mexample.com"
 * the SMTP Server
* SUPP_URL="support.example.com"
 * Supply a support URL where your users will get support
* MAIL_NAME="My Example Roundcube"
 * Your Name of your Roundcube installation
* LANG="de_DE"
 * Your Locale e.g. de_DE, en_US
* RC_TIMEZONE="Europe/Berlin"
 * see: http://php.net/manual/en/timezones.php
* PASSWORD_PLUGIN="YES"
 * If this variable is set, then the Password Plugin is activated! Just leave it out if you do not want the password plugin.
* VMAIL_DB_HOST="db"
 * Set this to your Database where your manage your users
* VMAIL_DB_PW="my-vmail-database-user-password"
 * Set this to the password to access the virtual mail database
* VMAIL_DB_USER="postfix"
 * this is the User with whom you're connecting to the virtual mail database



##Password Addon

The Password Addon lets you change your Password for your IMAP Account. Usually its a Dovecot Account.
I've activated the plugin and it's set like this:

```
$config['password_db_dsn'] = 'mysql://{{DB_USR}}:{{DB_PASSWORD}}@{{DB_HOST}}/vmail';
$config['password_query'] = 'UPDATE users SET password=%D WHERE username=%l AND domain=%d LIMIT 1';
// Path for dovecotpw (if not in $PATH)
$config['password_dovecotpw'] = 'doveadm pw';
// Dovecot method (dovecotpw -s 'method')
$config['password_dovecotpw_method'] = 'SSHA512';
```
