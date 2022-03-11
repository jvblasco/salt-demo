install_fail2ban_local:
  file.managed:
    - name: /etc/fail2ban/fail2ban.local
    - source: salt://fail2ban/files/fail2ban.local
    - user: root
    - group: root
    - mode: 644

install_jail_local:
  file.managed:
    - name: /etc/fail2ban/jail.local
    - source: salt://fail2ban/files/jail.local
    - user: root
    - group: root
    - mode: 644
