{% from 'salt/map.jinja' import salt_settings with context %}

install_salt-minion_service:
  pkg.installed:
    - pkgs:
      - {{ salt_settings['pkgs']['client'] }}
