{% set zones = salt['pillar.get']('firewalld:zones', False) -%}
{% set services = salt['pillar.get']('firewalld:config:services', False) -%}

{% if zones %}
create_zones_dir:
  file.directory:
    - name: /etc/firewalld/zones
    - user: root
    - group: root
    - dir_mode: 750
    - file_mode: 640
{% endif %}

{% if zones %}
{% for zone in zones %}
{% if salt['pillar.get']('firewalld:zones:' + zone, False) %}
install_{{ zone }}_zone:
  file.managed:
    - name: /etc/firewalld/zones/{{ zone }}.xml
    - source: salt://firewalld/files/zone.xml
    - template: jinja
    - user: root
    - group: root
    - mode: 640
    - defaults:
        zone: {{ zone }}
{% endif %}
{% endfor %}
{% endif %}

{% if services %}
create_services_dir:
  file.directory:
    - name: /etc/firewalld/services
    - user: root
    - group: root
    - dir_mode: 750
    - file_mode: 644

{% for service in services %}
install_{{ service }}_service:
  file.managed:
    - name: /etc/firewalld/services/{{ service }}.xml
    - source: salt://firewalld/files/services/{{ service }}.xml
    - template: jinja
    - user: root
    - group: root
    - mode: 644
{% endfor %}
{% endif %}
