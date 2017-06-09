class profiles::designate {

  include ::designate::client
  include ::designate::central
  include ::designate::db::mysql
  include ::designate::keystone::auth
  include ::designate::keystone::authtoken

  class {'::designate::backend::bind9':
    rndc_config_file => '',
    rndc_key_file    => '',
  }

}