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

  exec { 'Visudo syntax check sudoers':
    command   => "visudo -c -f ${tmpfile}",
    path      => '/bin:/sbin:/usr/bin:/usr/sbin',
    unless    => "diff /etc/sudoers ${tmpfile}",
    before    => File['/etc/sudoers'],
    subscribe => File[$tmpfile],
    logoutput => 'on_failure',
  }

  file { '/etc/sudoers':
    source  => $tmpfile,
  }
}
