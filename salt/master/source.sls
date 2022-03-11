{% from 'salt/map.jinja' import salt_settings with context %}

install_salt-master_states_repository:
  git.latest:
    - name: ssh://git@git.sebafactory.com:10022/seba/sebasalt-states.git
    - rev: master
    - user: root
    - target: /srv/salt/sebasalt/states
    - identity: /srv/salt/deploy_keys/id_rsa
    - force_reset: True
    - force_checkout: True
    - force_fetch: True
    - force_clone: True
    - fetch_tags: True
    - update_head: True

set_states_repository_permissions:
  file.directory:
    - name: /srv/salt/sebasalt/states
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode

install_salt-master_pillar_repository:
  git.latest:
    - name: ssh://git@git.sebafactory.com:10022/seba/{{ salt_settings['pillar_repository'] }}.git
    - rev: master
    - user: root
    - target: /srv/salt/sebasalt/pillar
    - identity: /srv/salt/deploy_keys/id_rsa
    - force_reset: True
    - force_checkout: True
    - force_fetch: True
    - force_clone: True
    - fetch_tags: True
    - update_head: True

set_pillar_repository_permissions:
  file.directory:
    - name: /srv/salt/sebasalt/pillar
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode

{% if salt_settings.modules %}

install_salt-master_modules_repository:
  git.latest:
    - name: ssh://git@git.sebafactory.com:10022/seba/sebasalt-modules.git
    - rev: master
    - user: root
    - target: /srv/salt/sebasalt/modules
    - identity: /srv/salt/deploy_keys/id_rsa
    - force_reset: True
    - force_checkout: True
    - force_fetch: True
    - force_clone: True
    - fetch_tags: True
    - update_head: True

set_modules_repository_permissions:
  file.directory:
    - name: /srv/salt/sebasalt/modules
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - recurse:
      - user
      - group
      - mode

{% endif %}
