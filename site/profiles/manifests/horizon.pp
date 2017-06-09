#
class profiles::horizon {
  include ::apache
  include ::horizon

  class { '::horizon::wsgi::apache':
    $default_vhost_conf_no_ip = {
    docroot             => '/var/www/',
    wsgi_script_aliases => '/horizon /usr/share/openstack-dashboard/openstack_dashboard/wsgi/django.wsgi process-group=horizon',
    }
  }
}
