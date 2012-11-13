host { 'hunter.puppetlabs.lan':
  ensure       => present,
  host_aliases => ['hunter', 'puppet.puppetlabs.lan', 'puppet'],
  ip           => '127.0.0.1',
  target       => '/etc/hosts',
}
host { 'localhost.localdomain':
  ensure       => present,
  host_aliases => ['localhost'],
  ip           => '127.0.0.1',
  target       => '/etc/hosts',
}
host { 'localhost6.localdomain6':
  ensure       => present,
  host_aliases => ['localhost6'],
  ip           => '::1',
  target       => '/etc/hosts',
}

resources { 'host':
  purge => true,
}
