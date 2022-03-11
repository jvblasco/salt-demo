{% from 'mysql/map.jinja' import mysql_settings with context %}

install_percona_mysql_server_service:
  pkg.installed:
    - pkgs:
      - {{ mysql_settings['pkgs']['server'] }}

install_percona_mysql_service_extra_pkgs:
  pkg.installed:
    - pkgs:
      - python3-mysqldb
