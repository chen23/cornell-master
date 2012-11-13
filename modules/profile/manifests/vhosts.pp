class profile::vhosts($customers = hiera_array('customers')) {
  profile::vhosts::customer { $customers: }
}
