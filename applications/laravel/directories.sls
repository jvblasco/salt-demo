{% from 'applications/laravel/map.jinja' import laravel_settings with context %}

{% if laravel_settings['applications'] %}
{% for app in laravel_settings['applications'] %}

create_{{ app['name'] }}_{{ app['type'] }}_releases_dir:
  file.directory:
    - name: /srv/www/{{ app['base_domain'] }}/releases
    - user: {{ app['user'] }}
    - group: {{ app['user'] }}
    - dir_mode: 775
    - file_mode: 664
    - makedirs: True

create_{{ app['name'] }}_{{ app['type'] }}_shared_dir:
  file.directory:
    - name: /srv/www/{{ app['base_domain'] }}/shared/web
    - user: {{ app['user'] }}
    - group: {{ app['user'] }}
    - dir_mode: 775
    - file_mode: 664
    - makedirs: True

create_{{ app['name'] }}_{{ app['type'] }}_deploys_dir:
  file.directory:
    - name: /srv/www/{{ app['base_domain'] }}/shared/deploys
    - user: {{ app['user'] }}
    - group: {{ app['user'] }}
    - dir_mode: 755
    - file_mode: 644
    - makedirs: True

create_{{ app['name'] }}_{{ app['type'] }}_public_dir:
  file.directory:
    - name: /srv/www/{{ app['base_domain'] }}/shared/web/laravel/storage
    - user: {{ app['user'] }}
    - group: {{ app['user'] }}
    - dir_mode: 755
    - file_mode: 644
    - makedirs: True

{% endfor %}
{% endif %}
