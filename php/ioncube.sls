{% from 'php/map.jinja' import php_settings with context %}

download_ioncube_loaders:
  archive.extracted:
    - name: /opt/
    - source: https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz
    - skip_verify: True
    - archive_format: tar
    - if_missing: /opt/ioncube

install_ioncube_library_v{{ php_settings['version'] }}:
  file.copy:
    - name: /usr/lib/php/20131226/ioncube_loader_lin_{{ php_settings['version'] }}.so
    - source: /opt/ioncube/ioncube_loader_lin_{{ php_settings['version'] }}.so
    # - force: True
    - user: root
    - group: root
    - mode: 644

install_ioncube_ini_file:
  file.managed:
    - name: /etc/php/{{ php_settings['version'] }}/mods-available/ioncube.ini
    - source: salt://php/files/ioncube.ini
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
        settings: {{ php_settings }}

enable_ioncube_module_for_fpm:
  file.symlink:
    - name: /etc/php/{{ php_settings['version'] }}/fpm/conf.d/00-ioncube.ini
    - target: /etc/php/{{ php_settings['version'] }}/mods-available/ioncube.ini

enable_ioncube_module_for_cli:
  file.symlink:
    - name: /etc/php/{{ php_settings['version'] }}/cli/conf.d/00-ioncube.ini
    - target: /etc/php/{{ php_settings['version'] }}/mods-available/ioncube.ini
