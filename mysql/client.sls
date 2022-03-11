{% from 'mysql/map.jinja' import mysql_settings with context %}

install_percona_mysql_client_packages:
  pkg.installed:
    - pkgs:
      - {{ mysql_settings['pkgs']['client'] }}
