class profiles::rabbitmq (
  $rabbit_user = hiera('rabbit_user'),
  $rabbit_password = hiera('rabbit_password'),
) {

  include ::rabbitmq

  rabbitmq_user { $rabbit_user:
    admin    => false,
    password => $rabbit_password,
  }

  rabbitmq_user_permissions { "${rabbit_user}@/":
    configure_permission => '.*',
    read_permission      => '.*',
    write_permission     => '.*',
  }
}
