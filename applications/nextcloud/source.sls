ensure_nextcloud_release_exists:
  file.exists:
    - name: /home/nextcloud/nextcloud-12.0.4.zip

download_nextcloud_release:
  file.managed:
    - name: /home/nextcloud/nextcloud-12.0.4.zip
    - source: https://download.nextcloud.com/server/releases/nextcloud-12.0.4.zip
    - skip_verify: True
    - user: nextcloud
    - group: nextcloud
    - onfail:
      - ensure_nextcloud_release_exists

extract_nextcloud_release:
  archive.extracted:
    - name: /srv/www/nextcloud/
    - source: /home/nextcloud/nextcloud-12.0.4.zip
    - skip_verify: True
    - archive_format: zip
    - user: nextcloud
    - group: nextcloud
    - if_missing: /srv/www/nextcloud/nextcloud
