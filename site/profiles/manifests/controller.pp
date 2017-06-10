# Class: profiles::controller

#
class profiles::controller {

  include ::nova
  include ::profiles::nova
  include ::nova::consoleauth
  include ::nova::api
  include ::nova::placement
  include ::nova::keystone::auth
  include ::nova::keystone::auth_placement
  include ::nova::db::mysql
  include ::nova::db::mysql_api
  include ::nova::db::sync
  include ::nova::db::sync_api
  include ::nova::compute::spice
  include ::nova::conductor
  include ::nova::scheduler
  include ::nova::keystone::authtoken
  include ::nova::keystone::auth
  include ::neutron::keystone::authtoken
  include ::nova::cell_v2::simple_setup
  include ::nova::network::neutron
  include ::nova::wsgi::apache_placement
  include ::horizon

  package { 'nova-placement-api':
    ensure => 'latest',
  }

  neutron_config {
  'DEFAULT/external_dns_driver':
  value => 'designate';
  'designate/url':
  value => "http://${lookup('control_node')}:9001/v2";
  'designate/admin_auth_url':
  value => "http://${lookup('control_node')}:35357/v2.0";
  'designate/admin_password':
  value => hiera('neutron::keystone::auth::password');
  'designate/admin_username':
  value => 'neutron';
  'designate/admin_tenant_name':
  value => 'services';
  'designate/allow_reverse_dns_lookup':
  value => true;
  'designate/ipv4_ptr_zone_prefix_size':
  value => '24';
  'designate/ipv6_ptr_zone_prefix_size':
  value => '64';
  }

}
