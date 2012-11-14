class usermanagement {
  file { '/home':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
}
