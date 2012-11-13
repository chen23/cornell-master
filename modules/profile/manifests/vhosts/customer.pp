define profile::vhosts::customer($customer = $name) {
  $vhosts = hiera_hash('vhosts')
  create_resources('notify',$vhosts)
}
