class profiles::nova
{
  $nova_deps = ['websockify']
  package { $nova_deps:
    ensure => 'latest',
  }
}
