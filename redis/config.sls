{% from 'redis/map.jinja' import redis_settings with context %}

install_redis_server_configuration_file:
  file.managed:
    - name: /etc/redis/redis.conf
    - source: salt://redis/files/redis.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - defaults:
        settings: {{ redis_settings }}
