{% from 'mysql/map.jinja' import mysql_settings with context %}
{% from 'users/map.jinja' import users_settings with context %}
{% from 'applications/map.jinja' import apps_settings with context %}

{% for username, config in users_settings['users'].items() %}
{% if config['role'] == 'admin' %}
install_my_cnf_for_admin_{{ username }}:
  file.managed:
    - name: /home/{{ username }}/.my.cnf
    - source: salt://mysql/files/my.cnf
    - user: {{ username }}
    - group: {{ username }}
    - mode: 600
    - template: jinja
    - defaults:
        user: root
        {% if grains['id'].startswith('backend') %}
        host: 127.0.0.1
        {% else %}
        host: {{ mysql_settings['host'] }}
        {% endif %}
        password: {{ mysql_settings['admin_password'] }}

{% elif config['role'] == 'developer' %}

install_my_cnf_for_developer_{{ username }}:
  file.managed:
    - name: /home/{{ username }}/.my.cnf
    - source: salt://mysql/files/my.cnf
    - user: {{ username }}
    - group: {{ username }}
    - mode: 600
    - template: jinja
    - defaults:
        user: developers
        {% if grains['id'].startswith('backend') %}
        host: 127.0.0.1
        {% else %}
        host: {{ mysql_settings['host'] }}
        {% endif %}
        password: {{ mysql_settings['devs_password'] }}
{% endif %}
{% endfor %}

{% if apps_settings.applications %}
{% for app in apps_settings.applications %}
install_my_cnf_for_application_{{ app['name'] }}:
  file.managed:
    - name: /srv/www/{{ app['base_domain'] }}/.my.cnf
    - source: salt://mysql/files/my.cnf
    - user: {{ app['user'] }}
    - group: {{ app['user'] }}
    - mode: 600
    - template: jinja
    - defaults:
        user: developers
        {% if grains['id'].startswith('backend') %}
        host: 127.0.0.1
        {% else %}
        host: {{ mysql_settings['host'] }}
        {% endif %}
        password: {{ mysql_settings['devs_password'] }}
{% endfor %}
{% endif %}
