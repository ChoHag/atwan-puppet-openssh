class openssh::server(
  $config_PermitRootLogin = $openssh::server::params::config_PermitRootLogin,
) inherits openssh::server::params {
  class{'openssh::server::install': } ->
  class{'openssh::server::config': }  ->
  class{'openssh::server::service': } ->
  Class['openssh::server']
}
