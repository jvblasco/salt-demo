{% from 'php/map.jinja' import php_settings with context %}

install_laravel_extra_packages:
  pkg.installed:
    - pkgs:
      - php{{ php_settings['version'] }}-gd
      - php{{ php_settings['version'] }}-mcrypt
      - php{{ php_settings['version'] }}-mysql
      - php{{ php_settings['version'] }}-xml
      - php{{ php_settings['version'] }}-curl
      - php{{ php_settings['version'] }}-soap
      - php-redis
