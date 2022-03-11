{% from 'applications/wordpress/map.jinja' import wordpress_settings with context %}
{% from 'mysql/map.jinja' import mysql_settings with context %}

{% if wordpress_settings['applications'] %}
{% for app in wordpress_settings['applications'] %}

{% for database in app['databases'] %}
add_{{ app['name'] }}_{{ database['name'] }}_database:
  mysql_database.present:
    - name: {{ database['name'] }}
    - character_set: utf8
    - collate: utf8_general_ci
    - connection_host: localhost
    - connection_user: root
    - connection_pass: {{ mysql_settings['admin_password'] }}

add_{{ app['name'] }}_{{ database['name'] }}_database_user:
  mysql_user.present:
    - name: {{ database['user'] }}
    - host: '%'
    - password: '{{ database['password'] }}'
    - connection_host: localhost
    - connection_user: root
    - connection_pass: {{ mysql_settings['admin_password'] }}

add_{{ app['name'] }}_{{ database['name'] }}_database_user_grants:
  mysql_grants.present:
    - name: {{ app['name'] }}_{{ database['name'] }}
    - grant: all privileges
    - database: '{{ database['name'] }}.*'
    - grant_option: True
    - user: {{ database['user'] }}
    - host: '%'
    - connection_host: localhost
    - connection_user: root
    - connection_pass: {{ mysql_settings['admin_password'] }}
{% endfor %}

{% endfor %}
{% endif %}
