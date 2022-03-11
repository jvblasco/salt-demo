install_composer_binary:
  cmd.run:
    - name: curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
    - env:
      - COMPOSER_HOME: '/var/lib/composer'
    - creates: /usr/local/bin/composer
