{%- set zones = salt['pillar.get']('firewalld:zones', False) -%}
{%- set services = salt['pillar.get']('firewalld:config:services', False) -%}

{%- if zones or services %}
reload_firewalld_when_changes:
  cmd.run:
    - name: "firewall-cmd --reload"
    - onchanges:
  {%- if zones %}
    {%- for zone, options in zones.items() %}
    {% if salt['pillar.get']('firewalld:zones:' + zone, False) %}
      - file: install_{{ zone }}_zone
    {% endif %}
    {%- endfor %}
  {%- endif %}
  {%- if services %}
    {%- for service in services %}
      - file: install_{{ service }}_service
    {%- endfor %}
  {%- endif %}
{%- endif %}

start_and_enable_firewalld:
  service.running:
    - name: firewalld
    - enable: True
    - reload: True
    - force: True
