start_and_enable_redis_service:
  service.running:
    - name: redis-server
    - enable: True
    - reload: True
    - force: True
