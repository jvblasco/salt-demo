{% from 'applications/magento/map.jinja' import magento_settings with context %}

{% if magento_settings['applications'] %}
{% for app in magento_settings['applications'] %}

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

create_{{ app['name'] }}_{{ app['type'] }}_var_dir:
  file.directory:
    - name: /srv/www/{{ app['base_domain'] }}/shared/web/var
    - user: {{ app['user'] }}
    - group: {{ app['user'] }}
    - dir_mode: 775
    - file_mode: 664
    - makedirs: True

create_{{ app['name'] }}_{{ app['type'] }}_media_dir:
  file.directory:
    - name: /srv/www/{{ app['base_domain'] }}/shared/web/media
    - user: {{ app['user'] }}
    - group: {{ app['user'] }}
    - dir_mode: 755
    - file_mode: 644
    - makedirs: True

create_{{ app['name'] }}_{{ app['type'] }}_sitemaps_dir:
  file.directory:
    - name: /srv/www/{{ app['base_domain'] }}/shared/web/sitemaps
    - user: {{ app['user'] }}
    - group: {{ app['user'] }}
    - dir_mode: 775
    - file_mode: 664
    - makedirs: True

create_{{ app['name'] }}_{{ app['type'] }}_etc_dir:
  file.directory:
    - name: /srv/www/{{ app['base_domain'] }}/shared/web/app/etc
    - user: {{ app['user'] }}
    - group: {{ app['user'] }}
    - dir_mode: 755
    - file_mode: 644
    - makedirs: True

{% endfor %}
{% endif %}
