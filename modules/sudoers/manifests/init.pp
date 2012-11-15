class sudoers($tmpfile = '/tmp/sudoers') {
  File {
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0440',
  }
  file { $tmpfile:
    source => 'puppet:///modules/sudoers/sudoers',
  }

  exec { 'visudo sudoers':
    command => "visudo -c -f ${tmpfile}",
    path    => '/bin:/sbin:/usr/bin:/usr/sbin',
    unless  => "diff /etc/sudoers ${tmpfile}",
  }

  file { '/etc/sudoers':
    source  => $tmpfile,
    require => Exec['visudo sudoers'],
  }

  # Something with visudo -c -f /tmp/sudoers
}
