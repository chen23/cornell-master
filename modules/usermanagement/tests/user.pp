#usermanagement::user { 'root':
#  ensure => present,
#}

usermanagement::user { 'elvis':
  ensure => absent,
  group  => 'elvis',
}

usermanagement::user { 'hunner':
  ensure  => present,
  homedir => '/var/lib/hunner',
  group   => 'elvis',
}

usermanagement::user { 'quux':
  ensure => absent,
}
