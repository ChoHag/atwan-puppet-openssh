class openssh::server::params {
  $package = 'openssh-server'
  $configfile = '/etc/ssh/sshd_config'

  $config_AddressFamily   = 'any'
  $config_ListenAddress   = [ '0.0.0.0', '::' ]
  $config_Port            = 22
  $config_Protocol        = 2
  # SyslogFacility is per-OS
  $config_LogLevel        = 'INFO'
  # HostKey is per-OS
  $config_UsePAM          = 'yes'
  $config_PermitRootLogin = 'no'
  $config_X11Forwarding   = 'no'

  case $::osfamily {
    debian: {
      $service_name = 'ssh'
      $config_SyslogFacility = 'AUTH'
      $config_HostKey = [
	'/etc/ssh/ssh_host_rsa_key',
	'/etc/ssh/ssh_host_dsa_key',
	'/etc/ssh/ssh_host_ecdsa_key'
      ]
      $config_AcceptEnv = [ 'LANG', 'LC_*' ]
      $config_Subsystem = {
	'sftp' => '/usr/lib/openssh/sftp-server'
      }
    }
    redhat: {
      $service_name   = 'sshd'
      $config_SyslogFacility = 'AUTHPRIV'
      $config_HostKey = [
	'/etc/ssh/ssh_host_rsa_key',
	'/etc/ssh/ssh_host_dsa_key'
      ]
      $config_AcceptEnv = [
	'LANG', 'LANGUAGE', 'LC_ADDRESS', 'LC_ALL', 'LC_COLLATE', 'LC_CTYPE',
	'LC_IDENTIFICATION', 'LC_MEASUREMENT', 'LC_MESSAGES', 'LC_MONETARY',
	'LC_NAME', 'LC_NUMERIC', 'LC_PAPER', 'LC_TELEPHONE', 'LC_TIME',
	'XMODIFIERS'
      ]
      $config_Subsystem = {
	'sftp' => '/usr/libexec/openssh/sftp-server'
      }
    }
  }
}
