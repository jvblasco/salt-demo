install_composer_environment_variables_file:
  file.managed:
    - name: /etc/profile.d/composer_home.sh
    - source: salt://composer/files/env_vars.jinja
    - user: root
    - group: root
    - mode: 644
