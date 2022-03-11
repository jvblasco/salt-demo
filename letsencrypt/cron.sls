letsencrypt_renew_cron:
  cron.present:
    name: 'certbot -q --keep-until-expiring renew --post-hook "systemctl reload nginx"'
    user: root
    minute: 0
    hour: 3
