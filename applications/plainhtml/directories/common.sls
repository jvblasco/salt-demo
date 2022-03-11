{% from 'applications/plainhtml/map.jinja' import plainhtml_settings with context %}

{% if plainhtml_settings['applications'] %}
{% for app in plainhtml_settings['applications'] %}

create_{{ app['name'] }}_{{ app['type'] }}_releases_dir:
  file.directory:
    - name: /srv/www/{{ app['base_domain'] }}/releases
    - user: {{ app['user'] }}
    - group: {{ app['user'] }}
    - dir_mode: 775
    - file_mode: 664
    - makedirs: True

{% endfor %}
{% endif %}
