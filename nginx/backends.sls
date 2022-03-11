{% from 'nginx/map.jinja' import nginx_settings with context %}
{% from 'applications/map.jinja' import apps_settings with context %}

{% if apps_settings['applications'] %}
{% for app in apps_settings['applications'] %}
{% if 'php' == app['language'] %}

install_{{ app['name'] }}_nginx_backend_users:
  file.managed:
    - name: /etc/nginx/backends/{{ app['name'] }}_users
    - source: salt://nginx/files/backend.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
        app: {{ app }}
        type: users

install_{{ app['name'] }}_nginx_backend_admins:
  file.managed:
    - name: /etc/nginx/backends/{{ app['name'] }}_admins
    - source: salt://nginx/files/backend.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
        app: {{ app }}
        type: admins

{% endif %}
{% endfor %}
{% endif %}
