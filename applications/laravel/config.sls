{% from 'applications/laravel/map.jinja' import laravel_settings with context %}

{% if laravel_settings['applications'] %}
{% for app in laravel_settings['applications'] %}

install_{{ app['name'] }}_{{ app['type'] }}_configuration_file:
  file.managed:
    - name: /srv/www/{{ app['base_domain'] }}/shared/web/laravel/.env
    - source: salt://applications/laravel/files/env
    - template: jinja
    - user: {{ app['user'] }}
    - group: {{ app['user'] }}
    - mode: 644
    - defaults:
        app: {{ app }}

{% endfor %}
{% endif %}
