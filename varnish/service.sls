start_and_enable_varnish_server:
  service.running:
    - name: varnish
    - enable: True
    - reload: True
    - force: True
