{% from 'openssh/map.jinja' import openssh_settings with context %}

install_sshd_banner:
  file.managed:
    - name: /etc/ssh/banner
    - source: salt://openssh/files/banner
    - user: root
    - group: root
    - mode: 644

install_sshd_config_file:
  file.managed:
    - name: /etc/ssh/sshd_config
    - source: salt://openssh/files/sshd_config
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
        settings: {{ openssh_settings }}
