{% from 'nginx/map.jinja' import nginx_settings with context %}

{% if nginx_settings['certificates'] %}
{% for certificate in nginx_settings['certificates'] %}

render_{{ certificate }}_certificate_private_key:
  file.managed:
    - name: /etc/nginx/certificates/{{ certificate }}.key
    - user: root
    - group: root
    - mode: 600
    - contents_pillar: certificates:{{ certificate }}:privkey

render_{{ certificate }}_certificate_public_key:
  file.managed:
    - name: /etc/nginx/certificates/{{ certificate }}.pem
    - user: root
    - group: root
    - mode: 644
    - contents_pillar: certificates:{{ certificate }}:pubkey

{% endfor %}
{% endif %}
