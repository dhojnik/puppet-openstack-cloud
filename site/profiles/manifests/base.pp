class profiles::base {
  include profiles::uca
  include ::ntp
  include ::openstacklib::openstackclient

  # add an alias to /etc/hosts to ensure sudo works
  host { $::hostname:
    ip => $::ipaddress,
  }
}
