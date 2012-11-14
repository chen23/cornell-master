class bluetooth::disable {
  service { 'hidd':
    ensure    => stopped,
    enable    => false,
    hasstatus => false,
    #status   => 'source /etc/init.d/functions && status hidd',
    before    => Package['bluez-utils'],
  }
  package { 'bluez-utils':
    ensure => absent,
    before => Package['bluez-libs'],
  }
  package { 'bluez-libs':
    ensure => absent,
  }
}
