{% from 'nfs/ng/map.jinja' import nfs_settings with context %}

install_nfs_client:
  pkg.installed:
    - pkgs:
      - {{ nfs_settings['pkgs']['client'] }}
