{% from 'nfs/ng/map.jinja' import nfs_settings with context %}
{% from 'applications/map.jinja' import apps_settings with context %}

{% if apps_settings['applications'] %}
{% for app in apps_settings['applications'] %}

add_and_mount_{{ app['name'] }}_{{ app['type'] }}_nfs_drive:
  mount.mounted:
    - name: /srv/www/{{ app['base_domain'] }}/shared
    - device: "{{ nfs_settings['server'] }}:/srv/shared/{{ app['name'] }}_{{ app['type'] }}"
    - fstype: nfs
    - opts: "vers=4.0,rw,rsize=65536,wsize=65536,hard,proto=tcp,timeo=10,retrans=2,sec=sys"
    - dump: 1
    - pass_num: 1
    - mkmnt: True
    - persist: True
    - mount: True

{% endfor %}
{% endif %}
