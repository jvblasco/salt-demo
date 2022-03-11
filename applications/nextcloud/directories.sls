create_nextcloud_application_dir:
  file.directory:
    - name: /srv/www/nextcloud
    - user: nextcloud
    - group: nextcloud
    - dir_mode: 755
    - file_mode: 644
    - makedirs: True
    - require:
      - create_user_nextcloud

create_nextcloud_data_dir:
  file.directory:
    - name: {{ pillar['applications']['nextcloud']['app']['datadir'] }}
    - user: www-data
    - group: www-data
    - makedirs: True
    - dir_mode: 755
    - file_mode: 644
