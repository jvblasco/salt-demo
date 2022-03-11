{% from 'mysql/map.jinja' import mysql_settings with context %}
{% from 'applications/map.jinja' import apps_settings with context %}

change_root_localhost_mysql_user_password_default:
  mysql_user.present:
    - name: root
    - host: localhost
    - password: {{ mysql_settings['admin_password'] }}
    - connection_host: localhost
    - connection_user: root
    - onlyif:
      - 'mysql -u root --execute "SELECT 1"'

change_root_localhost_ipv4_mysql_user_password:
  mysql_user.present:
    - name: root
    - host: '127.0.0.1'
    - password: {{ mysql_settings['admin_password'] }}
    - connection_host: localhost
    - connection_user: root
    - connection_pass: {{ mysql_settings['admin_password'] }}

change_root_localhost_ipv6_mysql_user_password:
  mysql_user.present:
    - name: root
    - host: '::1'
    - password: {{ mysql_settings['admin_password'] }}
    - connection_host: localhost
    - connection_user: root
    - connection_pass: {{ mysql_settings['admin_password'] }}

change_root_hostname_mysql_user_password:
  mysql_user.present:
    - name: root
    - host: {{ mysql_settings.hostname }}
    - password: {{ mysql_settings['admin_password'] }}
    - connection_host: localhost
    - connection_user: root
    - connection_pass: {{ mysql_settings['admin_password'] }}

add_root_wildcard_mysql_user_password:
  mysql_user.present:
    - name: root
    - host: '%'
    - password: {{ mysql_settings['admin_password'] }}
    - connection_host: localhost
    - connection_user: root
    - connection_pass: {{ mysql_settings['admin_password'] }}

add_developers_localhost_mysql_user:
  mysql_user.present:
    - name: developers
    - host: 'localhost'
    - password: {{ mysql_settings['devs_password'] }}
    - connection_host: localhost
    - connection_user: root
    - connection_pass: {{ mysql_settings['admin_password'] }}

add_developers_localhost_ipv4_mysql_user:
  mysql_user.present:
    - name: developers
    - host: '127.0.0.1'
    - password: {{ mysql_settings['devs_password'] }}
    - connection_host: localhost
    - connection_user: root
    - connection_pass: {{ mysql_settings['admin_password'] }}

add_developers_hostname_mysql_user:
  mysql_user.present:
    - name: developers
    - host: {{ mysql_settings.hostname }}
    - password: {{ mysql_settings['devs_password'] }}
    - connection_host: localhost
    - connection_user: root
    - connection_pass: {{ mysql_settings['admin_password'] }}

add_developers_wildcard_mysql_user:
  mysql_user.present:
    - name: developers
    - host: '%'
    - password: {{ mysql_settings['devs_password'] }}
    - connection_host: localhost
    - connection_user: root
    - connection_pass: {{ mysql_settings['admin_password'] }}

add_root_wildcard_user_grants:
  mysql_grants.present:
    - name: root_wildcard
    - grant: all privileges
    - database: '*.*'
    - grant_option: True
    - user: root
    - host: '%'
    - connection_host: localhost
    - connection_user: root
    - connection_pass: {{ mysql_settings['admin_password'] }}

remove_userless_localhost_mysql_user:
  mysql_user.absent:
    - name: ''
    - host: localhost
    - connection_host: localhost
    - connection_user: root
    - connection_pass: {{ mysql_settings['admin_password'] }}

remove_userless_host_mysql_user:
  mysql_user.absent:
    - name: ''
    - host: {{ mysql_settings.hostname }}
    - connection_host: localhost
    - connection_user: root
    - connection_pass: {{ mysql_settings['admin_password'] }}

{% if apps_settings['applications'] %}
{% for app in apps_settings['applications'] %}
{% if app['databases'] %}
{% for database in app['databases'] %}

add_developers_{{ database['name'] }}_localhost_user_grants:
  mysql_grants.present:
    - name: developers_localhost
    - grant: all privileges
    - database: '{{ database['name'] }}.*'
    - grant_option: True
    - user: developers
    - host: 'localhost'
    - connection_host: localhost
    - connection_user: root
    - connection_pass: {{ mysql_settings['admin_password'] }}

add_developers_{{ database['name'] }}_localhost_ipv4_user_grants:
  mysql_grants.present:
    - name: developers_localhost_ipv4
    - grant: all privileges
    - database: '{{ database['name'] }}.*'
    - grant_option: True
    - user: developers
    - host: '127.0.0.1'
    - connection_host: localhost
    - connection_user: root
    - connection_pass: {{ mysql_settings['admin_password'] }}

add_developers_{{ database['name'] }}_wildcard_user_grants:
  mysql_grants.present:
    - name: developers_wildcard
    - grant: all privileges
    - database: '{{ database['name'] }}.*'
    - grant_option: True
    - user: developers
    - host: '%'
    - connection_host: localhost
    - connection_user: root
    - connection_pass: {{ mysql_settings['admin_password'] }}

{% endfor %}
{% endif %}
{% endfor %}
{% endif %}
