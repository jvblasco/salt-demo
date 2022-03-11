{% from 'salt/map.jinja' import salt_settings with context %}
{% from 'users/map.jinja' import users_settings with context %}

configure_salt-master_server:
  file.managed:
    - name: /etc/salt/master
    - source: salt://salt/master/files/master.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - defaults:
        settings: {{ salt_settings }}
        users: {{ users_settings['users'] }}
    - watch:
      - pkg: install_salt-master_server

set_salt_log_directory_user_group_permissions_developers:
  file.directory:
    - name: /var/log/salt
    - user: root
    - group: developers
    - dir_mode: 755
    - file_mode: 664
    - recurse:
      - user
      - group
      - mode
