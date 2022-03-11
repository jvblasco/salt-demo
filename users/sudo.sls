sebafactory_install_package_sudo:
  pkg.installed:
    - pkgs:
      - sudo

sebafactory_developers_sudo_sudoers_salt_file:
  file.managed:
    - name: /etc/sudoers.d/developers
    - source: salt://users/files/sudo_developers
    - user: root
    - group: root
    - makedirs: True
    - mode: 440

sebafactory_admins_sudo_sudoers_salt_file:
  file.managed:
    - name: /etc/sudoers.d/admins
    - source: salt://users/files/sudo_admins
    - user: root
    - group: root
    - makedirs: True
    - mode: 440
