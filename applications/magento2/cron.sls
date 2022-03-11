{% from 'applications/magento2/map.jinja' import magento2_settings with context %}

{% if magento2_settings['applications'] %}
{% for app in magento2_settings['applications'] %}

add_{{ app['name'] }}_magento2_cron:
  cron.present:
    - name: /usr/bin/php /srv/www/{{ app['base_domain'] }}/current/bin/magento cron:run
    - user: {{ app['user'] }}
    - minute: '*/5'
    - identifier: magento2_cron

{% endfor %}
{% endif %}
