{% from 'haproxy/map.jinja' import haproxy_settings with context %}

install_haproxy_server_service:
  pkg.installed:
    - pkgs:
      - {{ haproxy_settings.pkgs.server }}
