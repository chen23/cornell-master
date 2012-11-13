file { '/tmp/os':
  ensure  => present,
  content => $::operatingsystem ? {
    'debian'    => "The one true OS: GNU/Hurd!\n",
    'windows'   => "...\n",
    'amazon'    => "You spent $.015 in the time it took to run this\n",
    'ubuntu'    => "Linux for your grandma, not your server\n",
    'centos'    => "CheapscateOS\n",
    'rhel'      => "Fedoras cost money\n",
    'archlinux' => "Linux for hipsters\n",
    'gentoo'    => "Linux for ricers\n",
    'solaris'   => "Welcome to the 20th century\n",
    default     => "Unknown OS: ${::operatingsystem}\n",
  },
}
