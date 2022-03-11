{% from 'openssh/map.jinja' import openssh_settings with context %}

install_openssh_service:
  pkg.installed:
    - pkgs:
      - {{ openssh_settings['pkgs']['server'] }}
