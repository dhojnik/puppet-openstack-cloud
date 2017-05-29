class profiles::mysql {

  $mysql_databases = hiera('mysql::db', undef)
  create_resources('mysql::db', hiera_hash('mysql_databases'))
}
