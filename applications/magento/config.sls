{% from 'applications/magento/map.jinja' import magento_settings with context %}

{% if magento_settings['applications'] %}
{% for app in magento_settings['applications'] %}

install_{{ app['name'] }}_{{ app['type'] }}_configuration_file:
  file.managed:
    - name: /srv/www/{{ app['base_domain'] }}/shared/web/app/etc/local.xml
    - source: salt://applications/magento/files/local.xml
    - template: jinja
    - user: {{ app['user'] }}
    - group: {{ app['user'] }}
    - mode: 644
    - defaults:
        app: {{ app }}

{% endfor %}
{% endif %}
