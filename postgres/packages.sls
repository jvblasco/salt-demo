{% from 'postgres/map.jinja' import postgres_settings with context %}

install_postgresql_service:
  pkg.installed:
    - pkgs:
      - {{ postgres_settings['pkgs']['server'] }}
