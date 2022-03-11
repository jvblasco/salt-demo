{% from 'system/map.jinja' import system_settings with context %}

set_machine_hostname:
  cmd.run:
    - name: hostnamectl set-hostname {{ system_settings['hostname'] }}
    - onlyif: test $(uname -n) != {{ system_settings['hostname'] }}

set_system_timezone:
  timezone.system:
    - name: {{ system_settings['timezone'] }}

create_dotfiles_directory:
  file.directory:
    - name: /opt/dotfiles
    - user: root
    - group: root
    - mode: 755

install_sebafactory_prompt_script:
  file.managed:
    - name: /opt/dotfiles/sebafactory-prompt.sh
    - source: salt://system/files/dotfiles/sebafactory-prompt.sh
    - user: root
    - group: root
    - mode: 644

install_complete_hosts_script:
  file.managed:
    - name: /opt/dotfiles/complete-hosts.sh
    - source: salt://system/files/dotfiles/complete-hosts.sh
    - user: root
    - group: root
    - mode: 644

install_git_completion_script:
  file.managed:
    - name: /opt/dotfiles/git-completion.sh
    - source: salt://system/files/dotfiles/git-completion.sh
    - user: root
    - group: root
    - mode: 644

install_sebafactory_bash_profile_configuration:
  file.managed:
    - name: /etc/profile.d/sebafactory.sh
    - source: salt://system/files/sebafactory.sh
    - user: root
    - group: root
    - mode: 644

install_sebafactory_bash_aliases:
  file.managed:
    - name: /etc/profile.d/sebafactory-aliases.sh
    - source: salt://system/files/sebafactory-aliases.sh
    - user: root
    - group: root
    - mode: 644

install_base_sysctl_configuration:
  file.managed:
    - name: /etc/sysctl.d/60-sebafactory_base.conf
    - source: salt://system/files/sysctl/base
    - user: root
    - group: root
    - mode: 644

{% if grains['id'].startswith('balancer') %}
render_balancer_sysctl_configuration:
  file.managed:
    - name: /etc/sysctl.d/70-sebafactory_balancer.conf
    - source: salt://system/files/sysctl/balancer
    - user: root
    - group: root
    - mode: 644
{% endif %}

{% if grains['id'].startswith('backend') %}
render_balancer_sysctl_configuration:
  file.managed:
    - name: /etc/sysctl.d/70-sebafactory_balancer.conf
    - source: salt://system/files/sysctl/balancer
    - user: root
    - group: root
    - mode: 644

disable_transparent_huge_pages_in_rc_local:
  file.managed:
    - name: /etc/rc.local
    - source: salt://system/files/rc.local
    - user: root
    - group: root
    - mode: 755
{% endif %}

add_sebafactory_kernel_modules:
  file.managed:
    - name: /etc/modules-load.d/sebafactory-modules.conf
    - source: salt://system/files/kernel-modules.conf
    - user: root
    - group: root
    - mode: 644
