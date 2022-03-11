install_firewalld_service:
  pkg.installed:
    - pkgs:
      - firewalld
