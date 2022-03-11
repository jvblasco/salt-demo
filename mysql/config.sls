{% from 'mysql/map.jinja' import mysql_settings with context %}

install_mysql_server_configuration_file:
  file.managed:
    - name: /etc/mysql/percona-server.conf.d/mysqld.cnf
    - source: salt://mysql/files/mysqld.cnf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
        settings: {{ mysql_settings }}

install_mysql_safe_configuration_file:
  file.managed:
    - name: /etc/mysql/percona-server.conf.d/mysqld_safe.cnf
    - source: salt://mysql/files/mysqld_safe.cnf
    - user: root
    - group: root
    - mode: 644

install_mysql_client_configuration_file:
  file.managed:
    - name: /etc/mysql/percona-server.conf.d/client.cnf
    - source: salt://mysql/files/client.cnf
    - user: root
    - group: root
    - mode: 644

remove_mysql_test_database:
  mysql_database.absent:
    - name: test
    - connection_host: localhost
    - connection_user: root
    - connection_pass: {{ mysql_settings['admin_password'] }}

include:
  - mysql.mycnf
