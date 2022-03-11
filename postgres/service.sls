start_and_enable_postgresql_server:
  service.running:
    - name: postgresql
    - enable: True
    - reload: True
    - force: True
