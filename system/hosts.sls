{% from 'system/map.jinja' import system_settings with context %}

add_own_ip_in_hosts:
  host.present:
    - name: {{ system_settings['hostname'] }}
    - ip: 127.0.0.1

{% if system_settings.hosts %}
{% for hostname, ip in system_settings['hosts'].items() %}
add_host_{{ hostname }}_in_hosts:
  host.present:
    - name: {{ hostname }}
    - ip: {{ ip }}
{% endfor %}
{% endif %}
