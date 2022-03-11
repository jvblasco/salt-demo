{% from 'varnish/map.jinja' import varnish_settings with context %}

install_varnish_service:
  pkg.installed:
    - pkgs:
      - {{ varnish_settings.pkgs.server }}

install_reload_vcl_script:
  file.managed:
    - name: /usr/sbin/varnish_reload_vcl
    - source: https://raw.githubusercontent.com/varnishcache/pkg-varnish-cache/master/redhat/varnish_reload_vcl
    - skip_verify: True
    - user: root
    - group: root
    - mode: 755
