# Class: 
#
#
class profiles::openrc {

file { '/root/openrc':
  ensure    => present,
  owner     => 'root',
  group     => 'root',
  mode      => '0600',
  content   =>
"
export OS_AUTH_URL=http://192.168.253.10:5000/v3/
export OS_PROJECT_ID=0df5a96aeba5418c9a0ba5f676d61ab8
export OS_PROJECT_NAME="admin"
export OS_USER_DOMAIN_NAME="Default"
if [ -z "$OS_USER_DOMAIN_NAME" ]; then unset OS_USER_DOMAIN_NAME; fi
unset OS_TENANT_ID
unset OS_TENANT_NAME
export OS_USERNAME="admin"
echo "Please enter your OpenStack Password for project $OS_PROJECT_NAME as user $OS_USERNAME: "
read -sr OS_PASSWORD_INPUT
export OS_PASSWORD=$OS_PASSWORD_INPUT
export OS_REGION_NAME="ImperiumAlpha"
if [ -z "$OS_REGION_NAME" ]; then unset OS_REGION_NAME; fi
export OS_INTERFACE=public
export OS_IDENTITY_API_VERSION=3
"
}