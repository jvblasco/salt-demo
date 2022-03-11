remove_nginx_default_vhost_link:
  file.absent:
    - name: /etc/nginx/sites-enabled/default

remove_nginx_default_vhost:
  file.absent:
    - name: /etc/nginx/sites-available/default
