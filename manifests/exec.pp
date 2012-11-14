exec { 'Create a file':
  command => '/bin/touch /tmp/foo',
  creates => '/tmp/foo',
}
