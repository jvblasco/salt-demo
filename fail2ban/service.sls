reload_fail2ban_when_changes:
  cmd.run:
    - name: "systemctl reload fail2ban"
    - onchanges:
      - file: install_fail2ban_local
      - file: install_jail_local

start_and_enable_fail2ban_service:
  service.running:
    - name: fail2ban
    - enable: True
    - reload: True
    - force: True
