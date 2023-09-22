# Class baseconfig
class baseconfig (
  $pkg_ntp = $baseconfig::params::pkg_ntp,
  $linux_users = $baseconfig::params::linux_users
) inherits baseconfig::params{
    notify {'os-name':
      message => "Aplicando alterações no host que utilza o sistema operacional ${::os['name']}."
    }

    $linux_users.each | Data $user | {
      user { $user['user']['name']:
        ensure     => $user['user']['ensure'],
        managehome => 'true',
        home       => "/home/${user['user']['name']}",
        before     => File["/home/${user['user']['name']}"]
      }
      if $user['user']['ensure'] == 'present' {
        $home_dir = 'directory'
      }
      elsif $user['user']['ensure'] == 'absent' {
        $home_dir = 'absent'
      }
      file { "/home/${user['user']['name']}":
        ensure  => $home_dir,
        recurse => true,
        force   => true
      }
    }

    if $pkg_ntp == true {
      notify {'ntp-installed':
        message => 'ntp package installed',
        require => Service[$service]
      }
      package {'ntp':
        ensure => 'installed'
      }
      if $::osfamily == 'RedHat' {
        $service = 'ntpd'
      }
      elsif $::osfamily == 'Debian' {
        $service = 'ntp'
      }
      service {$service:
        ensure => 'running',
        enable => 'true',
      }
    }
  }
