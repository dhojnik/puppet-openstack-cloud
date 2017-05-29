class profiles::vswitch {

vs_bridge { 'openstack':
  ensure => present,
}

vs_port { 'ens4':
  ensure => present,
  bridge => 'openstack',
}

}
