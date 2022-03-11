start_and_enable_mysql_service:
  service.running:
    - name: mysql
    - enable: True
    - reload: True
    - force: True
