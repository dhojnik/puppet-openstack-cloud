class profiles::postgresql {

  $config_entry = hiera_hash('postgresql::server::config_entry', {})
  create_resources(postgresql::server::config_entry, $config_entry)

  $pg_hba_rule = hiera_hash('postgresql::server::pg_hba_rule', {})
  create_resources(postgresql::server::pg_hba_rule, $pg_hba_rule)

  $role = hiera_hash('postgresql::server::role', {})
  create_resources(postgresql::server::role, $role)

  $db = hiera_hash('postgresql::server::db', {})
  create_resources(postgresql::server::db, $db)

}
