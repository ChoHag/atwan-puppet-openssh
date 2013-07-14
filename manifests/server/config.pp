class openssh::server::config {
  $config_AddressFamily   = $openssh::server::config_AddressFamily
  $config_ListenAddress   = $openssh::server::config_ListenAddress
  $config_Port            = $openssh::server::config_Port
  $config_Protocol        = $openssh::server::config_Protocol
  $config_SyslogFacility  = $openssh::server::config_SyslogFacility
  $config_LogLevel        = $openssh::server::config_LogLevel
  $config_HostKey         = $openssh::server::config_HostKey
  $config_PermitRootLogin = $openssh::server::config_PermitRootLogin
  $config_X11Forwarding   = $openssh::server::config_X11Forwarding
  $config_AcceptEnv       = $openssh::server::config_AcceptEnv
  $config_Subsystem       = $openssh::server::config_Subsystem

  file {
    $openssh::server::configfile:
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('openssh/sshd_config.erb'),
  }
}
