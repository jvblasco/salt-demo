{% from 'applications/map.jinja' import apps_settings with context %}

{% if apps_settings['applications'] %}
{% for app in apps_settings['applications'] %}

{% if app['mounts'] %}
include:
  - nfs.client
{% endif %}

create_{{ app['name'] }}_{{ app['type'] }}_releases_dir:
  file.directory:
    - name: /srv/www/{{ app['base_domain'] }}/releases
    - user: {{ app['user'] }}
    - group: {{ app['user'] }}
    - dir_mode: 775
    - file_mode: 664
    - makedirs: True

create_{{ app['name'] }}_{{ app['type'] }}_shared_web_dir:
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
{% endfor %}
{% endif %}
