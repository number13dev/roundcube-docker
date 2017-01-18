<?php

/* Local configuration for Roundcube Webmail */

// SQL DATABASE

$config['db_dsnw'] = 'mysql://{{DB_USER}}:{{DB_PASSWORD}}@{{DB_HOST}}/roundcube';

$config['default_host'] = 'tls://{{IMAP_SRV}}';
$config['smtp_server'] = 'tls://{{SMTP_SRV}}';
$config['smtp_port'] = 587;

$config['smtp_user'] = '%u';

$config['smtp_pass'] = '%p';

$config['support_url'] = '{{SUPP_URL}}';

$config['des_key'] = '{{DES_KEY}}';

$config['product_name'] = '{{MAIL_NAME}}';

// PLUGINS

$config['plugins'] = array(password);

$config['language'] = 'de_DE';
