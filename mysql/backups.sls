{% from 'mysql/map.jinja' import mysql_settings with context %}
{% from 'applications/map.jinja' import apps_settings with context %}

{% if apps_settings['applications'] %}
{% for app in apps_settings['applications'] %}
{% for database in app['databases'] %}

create_{{ app['name'] }}_{{ database['name'] }}_backups_dir:
  file.directory:
    - name: /srv/backups/{{ app['name'] }}/{{ database['name'] }}
    - user: {{ app['user'] }}
    - group: {{ app['user'] }}
    - dir_mode: 775
    - file_mode: 664
    - makedirs: True

add_{{ app['name'] }}_{{ database['name'] }}_db_backup_dump_cron:
  cron.present:
    - name: "mysqldump --single-transaction {{ database['name'] }}| gzip > /srv/backups/{{ app['name'] }}/{{ database['name'] }}/{{ database['name'] }}_`/bin/date +\\%Y-\\%m-\\%dT\\%H_\\%M_\\%S`.sql.gz"
    - user: {{ app['user'] }}
    - minute: '0'
    - hour: '5'
    - identifier: backup_dump_{{ app['name'] }}_{{ database['name'] }}

add_{{ app['name'] }}_backup_dir_clean_cron:
  cron.present:
    - name: "find /srv/backups/{{ app['name'] }}/{{ database['name'] }} -type f -mtime +{{ mysql_settings['backup_retention'] }} -name '*.sql.gz' -execdir rm -- {} \\;"
    - user: {{ app['user'] }}
    - minute: '0'
    - hour: '6'
    - identifier: backup_clean_{{ app['name'] }}_{{ database['name'] }}

{% endfor %}
{% endfor %}
{% endif %}
