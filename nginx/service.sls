{% from 'nginx/map.jinja' import nginx_settings with context %}
{% from 'applications/map.jinja' import apps_settings with context %}

reload_nginx_when_changes:
  cmd.run:
    - name: "systemctl reload nginx"
    - onchanges:
      - file: install_ngix_main_config_file
      - file: install_nginx_drop_conf_file
{% if apps_settings['applications'] %}
{% for app in apps_settings['applications'] %}
{% if app['sites'] %}
{% for site in app['sites'] %}
      - file: install_{{ app['name'] }}_site_{{ site['name'] }}_nginx_vhost
      - file: enable_{{ app['name'] }}_site_{{ site['name'] }}_nginx_vhost
{% endfor %}
{% endif %}
{% endfor %}
{% endif %}

start_and_enable_nginx_server:
  service.running:
    - name: nginx
    - enable: True
    - reload: True
    - force: True
