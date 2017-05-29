class profiles::compute
{
  include ::nova
  include ::nova::compute
  include ::nova::compute::libvirt
  include ::nova::compute::spice
  include ::nova::compute::neutron
  include ::nova::network::neutron
  include ::nova::keystone::authtoken
  include ::nova::placement
  include ::neutron
  include ::neutron::keystone::authtoken

  class { '::neutron::agents::ml2::ovs':
    bridge_uplinks   => undef,
    bridge_mappings  => undef,
    enable_tunneling => hiera('neutron::agents::ml2::ovs::enable_tunneling'),
    tunnel_types     => hiera('neutron::agents::ml2::ovs::tunnel_types'),
    local_ip         => hiera('neutron::agents::ml2::ovs::local_ip'),
  }

  exec { "modprobe dummmy":
    command     => "modprobe dummmy",
    path        => '/sbin',
    user        => 'root',
    refreshonly => true,
  }

  exec { "${extnet_device} up":
    command     => "ip link set ${extnet_device} up",
    path        => '/sbin',
    user        => 'root',
    refreshonly => true,
  }
}
