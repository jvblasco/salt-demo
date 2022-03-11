{% from 'php/map.jinja' import php_settings with context %}
{% from 'applications/map.jinja' import apps_settings with context %}

remove_default_php_fpm_pool:
  file.absent:
    - name: /etc/php/{{ php_settings['version'] }}/fpm/pool.d/www.conf

{% if apps_settings['applications'] %}
{% for app in apps_settings['applications'] %}
{% if 'php' == app['language'] %}
{% for type, pool in php_settings['pools'].items() %}

install_{{ app['name'] }}_{{ type }}_pool:
  file.managed:
    - name: /etc/php/{{ php_settings['version'] }}/fpm/pool.d/{{ app['name'] }}_{{ type }}.conf
    - source: salt://php/files/pool.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
        app: {{ app }}
        pool: {{ pool }}
        type: {{ type }}
        settings: {{ php_settings }}

{% endfor %}
{% endif %}
{% endfor %}
{% endif %}
