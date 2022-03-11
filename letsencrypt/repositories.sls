add_certbot_ppa:
  pkgrepo.managed:
    - ppa: certbot/certbot
    - refresh: true
