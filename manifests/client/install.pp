class openssh::client::install {
  package {
    $openssh::client::package:
      ensure => present;
  }
}
