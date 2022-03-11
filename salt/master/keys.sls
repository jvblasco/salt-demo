create_salt_deploy_keys_dir:
  file.directory:
    - name: /srv/salt/deploy_keys
    - makedirs: True
    - user: root
    - group: root
    - dir_mode: 750
    - file_mode: 644

render_salt_private_deploy_key:
  file.managed:
    - name: /srv/salt/deploy_keys/id_rsa
    - user: root
    - group: root
    - mode: 600
    - contents_pillar: services:salt:keys:privkey

render_salt_public_deploy_key:
  file.managed:
    - name: /srv/salt/deploy_keys/id_rsa.pub
    - user: root
    - group: root
    - mode: 644
    - contents_pillar: services:salt:keys:pubkey
