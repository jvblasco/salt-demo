install_n98_magento_utility:
  file.managed:
    - name: /usr/local/bin/n98-magerun.phar
    - source: https://files.magerun.net/n98-magerun.phar
    - skip_verify: True
    - user: root
    - group: root
    - mode: 755
