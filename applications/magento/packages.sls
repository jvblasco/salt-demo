{% from 'applications/magento/map.jinja' import magento_settings with context %}
{% from 'php/map.jinja' import php_settings with context %}

install_magento_extra_packages:
  pkg.installed:
    - pkgs:
      - php{{ php_settings['version'] }}-gd
      {% if php_settings['version'] < 7.2 %}
      - php{{ php_settings['version'] }}-mcrypt
      {% endif %}
      - php{{ php_settings['version'] }}-mysql
      - php{{ php_settings['version'] }}-xml
      - php{{ php_settings['version'] }}-curl
      - php{{ php_settings['version'] }}-soap
      - php{{ php_settings['version'] }}-mbstring
      - php{{ php_settings['version'] }}-zip
      - php-oauth
      - php-redis
      {% if magento_settings['applications'] %}
      {% for app in magento_settings['applications'] %}
      {% if app['compass'] %}
      - ruby-compass
      {% endif %}
      {% endfor %}
      {% endif %}
