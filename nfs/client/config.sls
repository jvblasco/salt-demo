{% from 'nfs/map.jinja' import nfs_settings with context %}
{% from 'applications/map.jinja' import apps_settings with context %}

{% if apps_settings['applications'] %}
{% for app in apps_settings['applications'] %}
{% if app['mounts'] %}
{% for mount, config in app['mounts'].items() %}

add_and_mount_{{ mount }}_nfs_drive:
  mount.mounted:
    - name: /srv/www/{{ app['base_domain'] }}/shared
    - device: "{{ config['device'] }}"
    - fstype: nfs
    - opts: "vers=4.0,rw,rsize=65536,wsize=65536,hard,proto=tcp,timeo=10,retrans=2,sec=sys"
    - dump: 1
    - pass_num: 1
    - mkmnt: True
    - persist: True
    - mount: True

{% endfor %}
{% endif %}
{% endfor %}
{% endif %}
