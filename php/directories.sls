{% from 'php/map.jinja' import php_settings with context %}

create_php_fpm_log_directory_media_dir:
  file.directory:
    - name: /var/log/php{{ php_settings['version'] }}-fpm
    - user: root
    - group: root
    - makedirs: True
    - recurse:
      - user
      - group
      - mode
