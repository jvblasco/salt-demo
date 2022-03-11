base:
  '*':
    - system
    - openssh
    - firewalld
    - fail2ban
    - letsencrypt
    - users

  'master.sebafactory.com':
    - salt.master
    - salt.minion

  # Example magento environment
  'balancer01.example.magento.iurco.sebafactory.com':
    - applications.magento.servers.balancer
  'frontend01.example.magento.iurco.sebafactory.com':
    - applications.magento.servers.frontendmain_ng
  'frontend02.example.magento.iurco.sebafactory.com':
    - applications.magento.servers.frontend_ng
  'frontend03.example.magento.iurco.sebafactory.com':
    - applications.magento.servers.frontend_ng
  'frontend04.example.magento.iurco.sebafactory.com':
    - applications.magento.servers.frontend_ng
  'frontend05.example.magento.iurco.sebafactory.com':
    - applications.magento.servers.frontend_ng
  'frontend06.example.magento.iurco.sebafactory.com':
    - applications.magento.servers.frontend_ng
  'frontend07.example.magento.iurco.sebafactory.com':
    - applications.magento.servers.frontend_ng
  'frontend08.example.magento.iurco.sebafactory.com':
    - applications.magento.servers.frontend_ng
  'backend01.example.magento.iurco.sebafactory.com':
    - applications.magento.servers.backend_ng
  'backend02.example.magento.iurco.sebafactory.com':
    - applications.magento.servers.backend_ng
