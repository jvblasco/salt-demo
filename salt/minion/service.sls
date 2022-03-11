start_and_enable_salt-minion_service:
  service.running:
    - name: salt-minion
    - enable: True
