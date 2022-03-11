{% from 'users/map.jinja' import users_settings with context %}
{% from 'applications/map.jinja' import apps_settings with context %}

{% if users_settings['users'] %}
{% for username, data in users_settings['users'].items() %}

create_user_{{ username }}:
  user.present:
    - name: {{ username }}
    - createhome: True
    {% if salt['pillar.get']('users:' + username + ':password', False) %}
    - password: {{ password }}
    {% else %}
    - empty_password: True
    {% endif %}
    - shell: /bin/bash
    - groups:
      - developers
      - adm
      {% if data['role'] == 'admin' %}
      - admins
      {% endif %}
      {% if apps_settings['applications'] and grains['id'].startswith('front') %}
      {% for app in apps_settings['applications'] %}
      - {{ app['group'] }}
      {% endfor %}
      {% endif %}

create_ssh_{{ username }}_dir:
  file.directory:
    - name: /home/{{ username }}/.ssh
    - user: {{ username }}
    - group: {{ username }}
    - dir_mode: 755
    - file_mode: 644

configure_tmux_for_{{ username }}:
  file.managed:
    - name: /home/{{ username }}/.tmux.conf
    - source: salt://users/files/tmux.conf
    - user: {{ username }}
    - group: {{ username }}
    - mode: 644

render_authorized_keys_for_{{ username }}:
  file.managed:
    - name: /home/{{ username }}/.ssh/authorized_keys
    - source: salt://users/files/authorized_keys
    - user: {{ username }}
    - group: {{ username }}
    - mode: 644
    - template: jinja
    - defaults:
        pubkeys: {{ data['pubkeys'] }}

configure_bash_prompt_for_{{ username }}:
  file.blockreplace:
    - name: /home/{{ username }}/.bashrc
    - marker_start: "# CUSTOM FILES START: salt managed zone do not edit"
    - marker_end: "# CUSTOM FILES END: end of salt managed zone"
    - append_if_not_found: True
    - content: |
        source /opt/dotfiles/sebafactory-prompt.sh

{% endfor %}
{% endif %}
