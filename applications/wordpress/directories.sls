{% from 'applications/wordpress/map.jinja' import wordpress_settings with context %}

{% if wordpress_settings['applications'] %}
{% for app in wordpress_settings['applications'] %}

create_{{ app['name'] }}_{{ app['type'] }}_uploads_dir:
  file.directory:
    - name: /srv/www/{{ app['base_domain'] }}/shared/web/wp-content/uploads
    - user: {{ app['user'] }}
    - group: {{ app['user'] }}
    - dir_mode: 775
    - file_mode: 664
    - makedirs: True

{% endfor %}
{% endif %}
