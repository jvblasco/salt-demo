<?php
$CONFIG = array (
  'instanceid' => 'sebacloud',
  'passwordsalt' => 'VBfT9NUKAkLz6YbxMq964ZiNLkrSJG',
  'secret' => 'yQC7w6MGNRIhzqCld/wzTsFdRk/iY78ay/YwnWuKiezGqrlZ',
  'trusted_domains' => 
  array (
    0 => '{{ pillar['applications']['nextcloud']['www']['domains']['main']  }}',
  ),
  'datadirectory' => '{{ pillar['applications']['nextcloud']['app']['datadir']  }}',
  'overwrite.cli.url' => 'http://nextcloud.sebafactory.com',
  'dbtype' => 'pgsql',
  'version' => '12.0.0.29',
  'dbname' => '{{ pillar['applications']['nextcloud']['database']['name']  }}',
  'dbhost' => 'localhost',
  'dbport' => '',
  'dbuser' => '{{ pillar['applications']['nextcloud']['database']['user']  }}',
  'dbpassword' => '{{ pillar['applications']['nextcloud']['database']['password']  }}',
  'installed' => true,
  'dbtableprefix' => 'oc_',
  'maintenance' => false,
  'logtimezone' => 'Europe/Madrid',
  'loglevel' => 2,
  'theme' => 'nextcloud-breeze-dark',
  'mail_from_address' => 'nexctloud',
  'mail_smtpmode' => 'php',
  'mail_smtpauthtype' => 'LOGIN',
  'mail_domain' => 'sebafactory.com',
);
