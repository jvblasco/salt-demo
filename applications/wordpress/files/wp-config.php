<?php
/*
* *** DO NOT EDIT THIS FILE ***
* This file is managed by Salt.
* Any changes will be overwritten.
*/

{%- for database in app['databases'] %}
define('DB_NAME', '{{ database['name'] }}');
define('DB_USER', '{{ database['user'] }}');
define('DB_PASSWORD', '{{ database['password'] }}');
define('DB_HOST', '{{ database['host'] }}');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

$table_prefix  = '{{ database['prefix'] }}';
{%- endfor %}
{%- if app['admin_ssl'] %}

define('FORCE_SSL_ADMIN', true);
{%- endif %}

define('AUTH_KEY',         '{{ app['keys']['auth'] }}');
define('SECURE_AUTH_KEY',  '{{ app['keys']['secure_auth'] }}');
define('LOGGED_IN_KEY',    '{{ app['keys']['logged_in'] }}');
define('NONCE_KEY',        '{{ app['keys']['nonce'] }}');
define('AUTH_SALT',        '{{ app['keys']['auth_salt'] }}');
define('SECURE_AUTH_SALT', '{{ app['keys']['secure_auth_salt'] }}');
define('LOGGED_IN_SALT',   '{{ app['keys']['logged_in_salt'] }}');
define('NONCE_SALT',       '{{ app['keys']['nonce_salt'] }}');

define('WP_DEBUG', false);

if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

require_once(ABSPATH . 'wp-settings.php');
