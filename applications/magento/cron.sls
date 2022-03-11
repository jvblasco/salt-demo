{% from 'applications/magento/map.jinja' import magento_settings with context %}

{% if magento_settings['applications'] %}
{% for app in magento_settings['applications'] %}

add_{{ app['name'] }}_magento_cron:
  cron.present:
    - name: /bin/sh /srv/www/{{ app['base_domain'] }}/current/cron.sh
    - user: {{ app['user'] }}
    - minute: '*/5'
    - identifier: magento_cron

{% endfor %}
{% endif %}
