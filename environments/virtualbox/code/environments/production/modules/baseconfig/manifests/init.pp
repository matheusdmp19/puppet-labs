# Class baseconfig
class baseconfig (
  $user_matheus = $baseconfig::params::user_matheus,
) inherits baseconfig::params{
  user { 'matheus':
      ensure     => $user_matheus,
      managehome => 'true',
      home       => '/home/matheus'
  }
}
