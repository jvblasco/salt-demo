{% from 'nfs/map.jinja' import nfs_settings with context %}

{% if nfs_settings['exports'] %}
{% for export, data in nfs_settings['exports'].items() %}

create_{{ export }}_nfs_export_dir:
  file.directory:
    - name: {{ data['path'] }}
    - dir_mode: 755
    - file_mode: 644
    - makedirs: True

{% endfor %}
{% endif %}

install_nfs_exports_configuration_file:
  file.managed:
    - name: /etc/exports
    - source: salt://nfs/server/files/exports
    - template: jinja
    - user: root
    - group: root
    - mode: 644
    - defaults:
        exports: {{ nfs_settings['exports'] }}
