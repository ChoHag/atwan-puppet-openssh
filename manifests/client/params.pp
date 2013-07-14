class openssh::client::params {
  $configfile = '/etc/ssh/ssh_config'

  case $::osfamily {
    debian: {
      $package = 'openssh-client'
    }
    redhat: {
      $package = 'openssh-clients'
    }
  }
}
