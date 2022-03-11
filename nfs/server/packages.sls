{% from 'nfs/map.jinja' import nfs_settings with context %}

install_nfs_server_service:
  pkg.installed:
    - pkgs:
      - {{ nfs_settings['pkgs']['server'] }}
