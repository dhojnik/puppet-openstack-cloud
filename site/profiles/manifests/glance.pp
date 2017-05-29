class profiles::glance(
  $cirros_version = undef,
) {
  include ::glance
  include ::glance::api
  include ::glance::registry
  include ::glance::api::authtoken
  include ::glance::registry::authtoken
  include ::glance::backend::file
  include ::glance::db::mysql
  include ::glance::keystone::auth
  include ::glance::notify::rabbitmq
}
