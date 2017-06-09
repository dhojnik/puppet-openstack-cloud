class profiles::nova {
  include ::nova

  $nova_deps = ['websockify']
  package { $nova_deps:
    ensure => 'latest',
  }
}
