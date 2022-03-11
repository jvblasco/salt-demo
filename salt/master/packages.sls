{% from 'salt/map.jinja' import salt_settings with context %}

install_salt-master_server:
  pkg.installed:
    - pkgs:
      - {{ salt_settings['pkgs']['server'] }}
