class bluetooth {
  package { ['bluez-libs','bluez-utils']:
    ensure => present,
    notify => Service['hidd'],
  }
  service { 'hidd':
    ensure    => running,
    enable    => true,
    hasstatus => false,
    #status   => 'source /etc/init.d/functions && status hidd',
  }
}
