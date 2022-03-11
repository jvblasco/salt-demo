start_and_enable_salt-master_service:
  service.running:
    - name: salt-master
    - enable: True
    - restart: True
    - onchange:
      - file: configure_salt-master_server
