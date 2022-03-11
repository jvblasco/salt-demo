{% from 'users/map.jinja' import users_settings with context %}
{% from 'applications/map.jinja' import apps_settings with context %}

{% if apps_settings['applications'] %}

ensure_srv_www_dir_exists:
  file.directory:
    - name: /srv/www/
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - makedirs: True

{% for app in apps_settings['applications'] %}

create_user_{{ app['name'] }}_{{ app['user'] }}:
  user.present:
    - name: {{ app['user'] }}
    - createhome: True
    - home: /srv/www/{{ app['base_domain'] }}
    - empty_password: True
    - groups:
      - www-data
    - shell: /bin/bash

create_ssh_{{ app['user'] }}_dir:
  file.directory:
    - name: /srv/www/{{ app['base_domain'] }}/.ssh
    - user: {{ app['user'] }}
    - group: {{ app['user'] }}
    - dir_mode: 755
    - file_mode: 644

render_private_deploy_key_for_{{ app['user'] }}:
  file.managed:
    - name: /srv/www/{{ app['base_domain'] }}/.ssh/id_rsa
    - user: {{ app['user'] }}
    - group: {{ app['user'] }}
    - mode: 600
    - contents_pillar: applications:{{ app['type'] }}:{{ app['name'] }}:deploy:keys:privkey

render_public_deploy_key_for_{{ app['user'] }}:
  file.managed:
    - name: /srv/www/{{ app['base_domain'] }}/.ssh/id_rsa.pub
    - user: {{ app['user'] }}
    - group: {{ app['user'] }}
    - mode: 644
    - contents_pillar: applications:{{ app['type'] }}:{{ app['name'] }}:deploy:keys:pubkey

{% endfor %}
{% endif %}
