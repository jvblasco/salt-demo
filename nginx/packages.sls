{% from 'nginx/map.jinja' import nginx_settings with context %}

install_nginx_service:
  pkg.installed:
    - pkgs:
      - {{ nginx_settings['pkgs']['server'] }}
      - apache2-utils
