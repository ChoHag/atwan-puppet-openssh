class openssh::client() inherits openssh::client::params {
  class{'openssh::client::install': } ->
#  class{'openssh::client::config': }  ->
  Class['openssh::client']
}
