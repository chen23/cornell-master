File {
  owner => 'root',
  group => 'root',
  mode  => '0610',
}
file { '/tmp/defaults':
  ensure => directory,
}
file { '/tmp/defaults/hello':
  ensure => present,
}
file { '/tmp/defaults/goodbye':
  ensure => present,
}
