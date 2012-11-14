# myenv::user { 'rootuser':
#   username => 'root',
# }
# myenv::user { 'hunner': }
define myenv::user ($username = $name) {
  include myenv

  $homedir = $username ? {
    'root'  => '/root',
    default => "/home/${username}",
  }

  File {
    owner => $username,
    group => $username,
    mode  => '0644',
  }
  file { "${homedir}/.vimrc":
    ensure => present,
    source => '/etc/puppetlabs/puppet/files/vimrc',
  }
  file { "${homedir}/.vim":
    ensure  => directory,
    recurse => true,
    source  => '/etc/puppetlabs/puppet/files/vim',
  }
  if $username == 'root' {
    file { "${homedir}/.ssh/authorized_keys":
      ensure => absent,
    }
  } else {
    file { "${homedir}/.ssh":
      ensure => directory,
      mode   => '0700',
    }
    file { "${homedir}/.ssh/authorized_keys":
      ensure => present,
      source => "/etc/puppetlabs/puppet/files/authorized_keys.${username}",
    }
  }
# case $username {
#   'root': {
#     file { "${homedir}/.ssh/authorized_keys":
#       ensure => absent,
#     }
#   }
#   default: {
#     file { "${homedir}/.ssh":
#       ensure => directory,
#       mode   => '0700',
#     }
#     file { "${homedir}/.ssh/authorized_keys":
#       ensure => present,
#       source => "/etc/puppetlabs/puppet/files/authorized_keys.${username}",
#     }
#   }
# }
}
