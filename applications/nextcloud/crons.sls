set_nextcloud_main_cron:
  cron.present:
    - name: php /srv/www/nextcloud/cron.php
    - user: nextcloud
    - minute: '*/15'
    - identifier: nextcloud-main-cron

set_nextcloud_filescan_cron:
  cron.present:
    - name: php /srv/www/nextcloud/occ files:scan --all
    - user: nextcloud
    - minute: '*/1'
    - identifier: nextcloud-main-cron
