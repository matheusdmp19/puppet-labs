# Params 
class baseconfig::params {
  $pkg_ntp = hiera('baseconfig::params::pkg_ntp', 'false')
  $linux_users = hiera('baseconfig::params::linux_users', '')
}
