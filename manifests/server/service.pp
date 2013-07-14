class openssh::server::service {
  service {
    $openssh::server::service_name:
      ensure     => running,
      hasstatus  => true,
      hasrestart => true,
      enable     => true,
  }
}
