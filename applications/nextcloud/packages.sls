{% from 'php/map.jinja' import php_settings with context %}

install_nextcloud_extra_packages:
  pkg.installed:
    - pkgs:
      - php{{ php_settings['version'] }}-pgsql
      - php{{ php_settings['version'] }}-curl
      - php{{ php_settings['version'] }}-gd
      - php{{ php_settings['version'] }}-xml
      - php{{ php_settings['version'] }}-zip
      - php{{ php_settings['version'] }}-mbstring
