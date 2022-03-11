install_composer_plugin_prestissimo:
  cmd.run:
    - name: /usr/local/bin/composer global require "hirak/prestissimo:^0.3"
    - env:
      - COMPOSER_HOME: '/var/lib/composer'
    - creates: /var/lib/composer/vendor/hirak/prestissimo/composer.json
    - require:
      - install_composer_binary
