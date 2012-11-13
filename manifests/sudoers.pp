file { '/etc/sudoers':
  ensure => present,
  owner  => 'root',
  group  => 'root',
  mode   => '0440',
  source => '/etc/puppetlabs/puppet/files/sudoers',
}
