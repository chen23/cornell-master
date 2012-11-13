class profile::cals_vhosts {
  $customer = 'cals'
  $vhosts = hiera_hash('vhosts')
  create_resources('notify',$vhosts)
}
