install_nextcloud_configuration_file:
  file.managed:
    - name: /srv/www/nextcloud/nextcloud/config/config.php
    - source: salt://applications/nextcloud/files/config.php
    - template: jinja
    - user: nextcloud
    - group: www-data
    - mode: 640
