# Params 
class baseconfig::params {
  $pkg_ntp = hiera('baseconfig::params::pkg_ntp', 'false')
  $linux_users = hiera('baseconfig::params::linux_users', '')
  $linux_users_absent = hiera('baseconfig::params::linux_users_absent', '')
  $lista_vazia = hiera('baseconfig::params::lista_vazia', '')
}
