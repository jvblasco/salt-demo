reload_sshd_when_changes:
  cmd.run:
    - name: "systemctl reload sshd"
    - onchanges:
      - file: install_sshd_banner
      - file: install_sshd_config_file

start_and_enable_openssh_server:
  service.running:
    - name: sshd
    - enable: True
    - reload: True
    - force: True
