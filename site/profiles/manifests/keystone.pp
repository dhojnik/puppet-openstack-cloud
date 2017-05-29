class profiles::keystone {
  include ::apache
# include profiles::users
  include profiles::openstack_users
  include ::keystone
  include ::keystone::cron::token_flush
  include ::keystone::roles::admin
  include ::keystone::endpoint
  include ::keystone::db::mysql
  include ::keystone::wsgi::apache
}
