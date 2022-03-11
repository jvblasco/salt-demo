{% from 'nfs/ng/map.jinja' import nfs_settings with context %}
{% from 'applications/map.jinja' import apps_settings with context %}

{% if apps_settings['applications'] %}
{% for app in apps_settings['applications'] %}

create_{{ app['name'] }}_{{ app['type'] }}_nfs_export_dir:
  file.directory:
    - name: /srv/shared/{{ app['name'] }}_{{ app['type'] }}
    - dir_mode: 755
    - file_mode: 644
    - makedirs: True

{% endfor %}
{% endif %}

install_nfs_exports_configuration_file:
  file.managed:
    - name: /etc/exports
    - source: salt://nfs/ng/server/files/exports
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - defaults:
        settings: {{ nfs_settings }}
        applications: {{ apps_settings['applications'] }}
