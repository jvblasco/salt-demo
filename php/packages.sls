{% from 'php/map.jinja' import php_settings with context %}

add_ondrej_php_ppa:
  pkgrepo.managed:
    - name: deb http://ppa.launchpad.net/ondrej/php/ubuntu xenial main
    - dist: xenial
    - file: /etc/apt/sources.list.d/ondrej-ubuntu-php-xenial.list
    - keyserver: keyserver.ubuntu.com
    - keyid: E5267A6C
    - refresh: true

install_php_fpm_service:
  pkg.installed:
    - pkgs:
      - php{{ php_settings['version'] }}-fpm
