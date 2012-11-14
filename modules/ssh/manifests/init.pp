class ssh {
  package { 'sshd':
    ensure => present,
    name   => 'openssh-server',
  }
  file { '/etc/ssh/sshd_config':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    source  => 'puppet:///modules/ssh/sshd_config',
    require => Package['sshd'],
    notify  => Service['sshd'],
  }
  service { 'sshd':
    ensure => running,
    enable => true,
  }
}
