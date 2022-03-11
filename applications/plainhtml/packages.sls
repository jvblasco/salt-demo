{% from 'applications/plainhtml/map.jinja' import plainhtml_settings with context %}

{% if plainhtml_settings['applications'] %}
{% for app in plainhtml_settings['applications'] %}

{% if app['node'] %}
add_nodesource_repository:
  pkgrepo.managed:
    - name: deb https://deb.nodesource.com/node_12.x xenial main
    - dist: xenial
    - file: /etc/apt/sources.list.d/nodesource.list
    - key_url: https://deb.nodesource.com/gpgkey/nodesource.gpg.key
    - refresh: true

install_nodejs_package:
  pkg.installed:
    - pkgs:
      - nodejs
{% endif %}

{% endfor %}
{% endif %}
