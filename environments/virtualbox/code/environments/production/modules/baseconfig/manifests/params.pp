# Params 
class baseconfig::params {
  $user_matheus = hiera('baseconfig::params::user_matheus', 'present')
  $linux_users = hiera('baseconfig::params::linux_users')
}
