{% from 'php/map.jinja' import php_settings with context %}

install_php_fpm_configuration_file:
  file.managed:
    - name: /etc/php/{{ php_settings['version'] }}/fpm/php-fpm.conf
    - source: salt://php/files/php-fpm.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
        settings: {{ php_settings }}

install_php_fpm_ini_file:
  file.managed:
    - name: /etc/php/{{ php_settings['version'] }}/fpm/php.ini
    - source: salt://php/files/php.ini
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
        settings: {{ php_settings }}

install_php_cli_ini_file:
  file.managed:
    - name: /etc/php/{{ php_settings['version'] }}/cli/php.ini
    - source: salt://php/files/php-cli.ini
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
        settings: {{ php_settings }}
