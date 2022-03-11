{% from 'php/map.jinja' import php_settings with context %}

# reload_phpfpm_when_changes:
  # cmd.run:
    # - name: "systemctl reload php7.0-fpm"
    # - onchanges:
      # - file: install_phpfpm_config_file
      # - file: install_phpfpm_pool_config_file

start_and_enable_phpfpm_service:
  service.running:
    - name: php{{ php_settings['version'] }}-fpm
    - enable: True
    - reload: True
    - force: True
