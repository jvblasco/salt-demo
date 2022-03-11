start_and_enable_haproxy_service:
  service.running:
    - name: haproxy
    - enable: True
    - reload: True
    - force: True
