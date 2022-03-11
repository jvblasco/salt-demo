start_and_enable_nfs_server_service:
  service.running:
    - name: nfs-kernel-server
    - enable: True
    - reload: True
    - force: True
