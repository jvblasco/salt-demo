create_composer_home_directory:
  file.directory:
    - name: /var/lib/composer
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - makedirs: True
