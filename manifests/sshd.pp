package { 'sshd':
  ensure => present,
  name   => 'openssh-server',
}
file { '/etc/ssh/sshd_config':
  ensure  => present,
  owner   => 'root',
  group   => 'root',
  mode    => '0600',
  source  => '/etc/puppetlabs/puppet/files/sshd_config',
  require => Package['sshd'],
  notify  => Service['sshd'],
}
service { 'sshd':
  ensure => running,
  enable => true,
}
notify { 'from sshd.pp':
  require => File['/etc/ssh/sshd_config'],
}
