{% from 'varnish/map.jinja' import varnish_settings with context %}

install_varnish_service_unit_file:
  file.managed:
    - name: /etc/systemd/system/varnish.service
    - source: salt://varnish/files/varnish.service
    - user: root
    - group: root
    - mode: 644

install_varnish_config_file:
  file.managed:
    - name: /etc/varnish/varnish.params
    - source: salt://varnish/files/varnish.params
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
        settings: {{ varnish_settings }}

install_varnish_vcl_file:
  file.managed:
    - name: {{ varnish_settings['vcl_file'] }}
    - source: salt://varnish/files/varnish.vcl
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - replace: False
    - defaults:
        settings: {{ varnish_settings }}
