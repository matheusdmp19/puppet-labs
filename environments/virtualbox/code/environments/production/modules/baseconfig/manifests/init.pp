# Class baseconfig
class baseconfig (
  $user_matheus = $baseconfig::params::user_matheus,
  $linux_users = $baseconfig::params::linux_users
) inherits baseconfig::params{
    user { 'matheus':
        ensure     => $user_matheus,
        managehome => 'true',
        home       => '/home/matheus'
    }

    $linux_users.each |$user| {
      user { $user:
        ensure     => 'present',
        managehome => 'true',
        home       => "/home/${user}"
      }
    }
  }
