class openssh::server::install {
  package {
    $openssh::server::package:
      ensure => present;
  }
}
