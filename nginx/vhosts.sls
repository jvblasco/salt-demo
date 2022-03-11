{% from 'nginx/map.jinja' import nginx_settings with context %}
{% from 'applications/map.jinja' import apps_settings with context %}

{% if apps_settings['applications'] %}
{% for app in apps_settings['applications'] %}
{% if app['sites'] %}
{% for site in app['sites'] %}

install_{{ app['name'] }}_site_{{ site['name'] }}_nginx_vhost:
  file.managed:
    - name: /etc/nginx/sites-available/{{ site['main_domain'] }}
{% if grains['id'].startswith('frontend') or grains['id'].startswith('single') %}
    - source: salt://nginx/files/vhosts/{{ app['type'] }}
{% elif grains['id'].startswith('balancer') %}
    - source: salt://nginx/files/vhosts/balancer
{% endif %}
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
        app: {{ app }}
        site: {{ site }}
{% if grains['id'].startswith('frontend') or grains['id'].startswith('single') %}
        {%- if site['extra_frontend_config_base'] %}
        extra_frontend_config_base: |
          {{ site['extra_frontend_config_base'] | indent(10) }}
        {%- endif %}
        {%- if site['extra_frontend_config_vhost'] %}
        extra_frontend_config_vhost: |
          {{ site['extra_frontend_config_vhost'] | indent(10) }}
        {%- endif %}
{%- endif %}
{% if app['balancer'] and grains['id'].startswith('frontend') %}
        ssl: False
        auth: False
        redirect: False
        rewrites: False
        protections: {{ site['protections'] }}
        localhost: False
{% elif app['balancer'] and grains['id'].startswith('balancer') %}
        {%- if site['extra_balancer_config'] %}
        extra_balancer_config: |
          {{ site['extra_balancer_config'] | indent(10) }}
        {%- endif %}
        ssl: {{ site['ssl'] }}
        auth: {{ site['auth'] }}
        rewrites: {{ site['rewrites'] }}
        protections: False
        localhost: False
        {% if site['ssl'] %}
        redirect: True
        {% else %}
        redirect: False
        {% endif %}
{% else %}
      {% if app['varnish'] %}
        ssl: False
        auth: False
        protections: False
        rewrites: False
        redirect: False
        localhost: True
      {% else %}
        ssl: {{ site['ssl'] }}
        auth: {{ site['auth'] }}
        protections: {{ site['protections'] }}
        rewrites: {{ site['rewrites'] }}
        localhost: False
        {% if site['ssl'] %}
        redirect: True
        {% else %}
        redirect: False
        {% endif %}
      {% endif %}
{% endif %}

enable_{{ app['name'] }}_site_{{ site['name'] }}_nginx_vhost:
  file.symlink:
    - name: /etc/nginx/sites-enabled/{{ site['main_domain'] }}
    - target: /etc/nginx/sites-available/{{ site['main_domain'] }}
    - require:
      - install_{{ app['name'] }}_site_{{ site['name'] }}_nginx_vhost

{% if app['varnish'] %}
install_{{ app['name'] }}_site_{{ site['name'] }}_varnish_proxy_vhost:
  file.managed:
    - name: /etc/nginx/sites-available/{{ site['main_domain'] }}_varnish-proxy
    - source: salt://nginx/files/vhosts/varnish_proxy
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - defaults:
        app: {{ app }}
        site: {{ site }}
        ssl: {{ site['ssl'] }}
        auth: {{ site['auth'] }}
        rewrites: {{ site['rewrites'] }}
        protections: {{ site['protections'] }}
        localhost: False
        {% if site['ssl'] %}
        redirect: True
        {% else %}
        redirect: False
        {% endif %}

enable_{{ app['name'] }}_site_{{ site['name'] }}_varnish_proxy_vhost:
  file.symlink:
    - name: /etc/nginx/sites-enabled/{{ site['main_domain'] }}_varnish-proxy
    - target: /etc/nginx/sites-available/{{ site['main_domain'] }}_varnish-proxy
    - require:
      - install_{{ app['name'] }}_site_{{ site['name'] }}_varnish_proxy_vhost
{% endif %}

{% endfor %}
{% endif %}
{% endfor %}
{% endif %}
