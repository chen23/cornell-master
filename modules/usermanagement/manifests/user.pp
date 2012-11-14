define usermanagement::user (
  $ensure,
  $group = $name,
  $homedir = "/home/${name}",
) {
  if $name == 'root' {
    fail("usermanagement::user cannot manage user root!")
  }

  user { $name:
    ensure => $ensure,
    gid    => $group,
    home   => $homedir,
  }
  if $ensure == 'present' {
    if ! defined(Group[$name]) {
      group { $group:
        ensure => present,
      }
    }
    file { $homedir:
      ensure => directory,
      owner  => $name,
      group  => $group,
      mode   => '0711',
    }
  }
}
