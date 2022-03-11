{% from 'php/map.jinja' import php_settings with context %}

include:
  - php.packages
  - php.directories
  - php.config
  - php.pools
  {% if php_settings['ioncube'] %}
  - php.ioncube
  {% endif %}
  - php.service
