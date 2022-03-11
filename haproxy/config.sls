install_haproxy_server_configuration_file:
  file.managed:
    - name: /etc/haproxy/haproxy.cfg
    - source: salt://haproxy/files/haproxy.cfg
    - template: jinja
    - user: root
    - group: root
    - mode: 644
