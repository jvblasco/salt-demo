{% from 'salt/map.jinja' import salt_settings with context %}
{% from 'system/map.jinja' import system_settings with context %}

configure_salt-minion_service:
  file.managed:
    - name: /etc/salt/minion
    - source: salt://salt/minion/files/minion.conf
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - defaults:
        settings: {{ salt_settings }}
        hostname: {{ system_settings['hostname'] }}
