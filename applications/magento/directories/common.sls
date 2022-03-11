{% from 'applications/magento/map.jinja' import magento_settings with context %}

{% if magento_settings['applications'] %}
{% for app in magento_settings['applications'] %}

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
