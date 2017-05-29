# Class: profiles::controller

#
class profiles::controller {

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

  package { 'nova-placement-api':
    ensure => 'latest',
  }

}
