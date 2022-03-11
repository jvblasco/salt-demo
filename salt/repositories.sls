install_saltstack_repository:
  pkgrepo.managed:
    - humanname: saltstack
    - name: deb http://repo.saltstack.com/py3/ubuntu/16.04/amd64/3000 xenial main
    - file: /etc/apt/sources.list.d/saltstack.list
    - key_url: https://repo.saltstack.com/py3/ubuntu/16.04/amd64/3000/SALTSTACK-GPG-KEY.pub
    - clean_file: True
