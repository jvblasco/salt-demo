{% from 'redis/map.jinja' import redis_settings with context %}

install_redis_server_service:
  pkg.installed:
    - pkgs:
      - {{ redis_settings['pkgs']['server'] }}

install_redis_server_service_extra_pkgs:
  pkg.installed:
    - pkgs:
      - python3-redis
