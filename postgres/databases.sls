{% set applications = salt['pillar.get']('applications', False) %}
{% if applications %}
{% for appname, data in applications.items() %}
{% if data['database']['type'] == 'postgresql' %}
create_{{ appname }}_postgres_user:
  postgres_user.present:
    - name: {{ data['database']['user'] }}
    - password: {{ data['database']['password'] }}
    - login: True
    - createdb: True

create_{{ appname }}_postgres_database:
  postgres_database.present:
    - name: {{ data['database']['name'] }}
    - owner: {{ data['database']['user'] }}
    - require:
      - create_{{ appname }}_postgres_user
{% endif %}
{% endfor %}
{% endif %}
