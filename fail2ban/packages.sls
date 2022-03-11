install_fail2ban_service:
  pkg.installed:
    - pkgs:
      - fail2ban
