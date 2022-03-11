{% from 'applications/wordpress/map.jinja' import wordpress_settings with context %}

{% if wordpress_settings['applications'] %}
{% for app in wordpress_settings['applications'] %}

install_{{ app['name'] }}_{{ app['type'] }}_configuration_file:
  file.managed:
    - name: /srv/www/{{ app['base_domain'] }}/shared/web/wp-config.php
    - source: salt://applications/wordpress/files/wp-config.php
    - template: jinja
    - user: {{ app['user'] }}
    - group: {{ app['user'] }}
    - mode: 644
    - defaults:
        app: {{ app }}

{% endfor %}
{% endif %}
