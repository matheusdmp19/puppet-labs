# Params 
class baseconfig::params {
  $user_matheus = hiera('baseconfig::params::user_matheus', 'present')
}
