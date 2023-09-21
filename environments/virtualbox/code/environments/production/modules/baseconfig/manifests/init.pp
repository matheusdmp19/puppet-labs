# Class baseconfig
class baseconfig (
  $pkg_ntp = $baseconfig::params::pkg_ntp,
  $linux_users = $baseconfig::params::linux_users,
  $linux_users_absent = $baseconfig::params::linux_users_absent,
  $lista_vazia = $baseconfig::params::lista_vazia
) inherits baseconfig::params{
    notify {'os-name':
      message => "Aplicando alterações no host que utilza o sistema operacional ${::os['name']}."
    }

    $lista_vazia.each |$teste| {
      user { $teste:
        ensure     => 'present',
        managehome => 'true',
        home       => "/home/${teste}"
      }
    }

    $linux_users.each |$user| {
      user { $user:
        ensure     => 'present',
        managehome => 'true',
        home       => "/home/${user}"
      }
    }

    $linux_users_absent.each |$user| {
      user { $user:
        ensure     => 'absent'
      }
    }

    if $pkg_ntp == true {
      notify {'ntp-installed':
        message => 'ntp package successfully installed'
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
