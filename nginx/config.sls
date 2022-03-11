{% from 'nginx/map.jinja' import nginx_settings with context %}
{% from 'applications/map.jinja' import apps_settings with context %}

create_nginx_backends_dir:
  file.directory:
    - name: /etc/nginx/backends
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - makedirs: True

create_nginx_certificates_dir:
  file.directory:
    - name: /etc/nginx/certificates
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - makedirs: True

install_nginx_dhparams_file:
  file.managed:
    - name: /etc/nginx/dhparams.pem
    - source: salt://nginx/files/dhparams.pem
    - user: root
    - group: root
    - mode: 644

install_ngix_main_config_file:
  file.managed:
    - name: /etc/nginx/nginx.conf
    - source: salt://nginx/files/nginx.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
        applications: {{ apps_settings['applications'] }}
        settings: {{ nginx_settings }}

install_nginx_drop_conf_file:
  file.managed:
    - name: /etc/nginx/drop.conf
    - source: salt://nginx/files/drop.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja

{% for user in nginx_settings['htpasswd_users'] %}
add_htpasswd_user_{{ user['name'] }}:
  webutil.user_exists:
    - name: {{ user['name'] }}
    - password: {{ user['password'] }}
    - htpasswd_file: /etc/nginx/htpasswd
    - update: True
{% endfor %}
