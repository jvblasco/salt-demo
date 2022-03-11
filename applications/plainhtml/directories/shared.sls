{% from 'applications/plainhtml/map.jinja' import plainhtml_settings with context %}

{% if plainhtml_settings['applications'] %}
{% for app in plainhtml_settings['applications'] %}

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

{% endfor %}
{% endif %}
