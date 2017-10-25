#
class grafana::ldap (
  Bodgitlib::LDAP::DN                     $bind_dn,
  Array[String, 1]                        $hosts,
  Array[Bodgitlib::LDAP::DN, 1]           $search_base_dns,
  Bodgitlib::LDAP::Filter                 $search_filter,
  Grafana::LDAP::Attributes               $attributes                         = {
    'name'      => 'givenName',
    'surname'   => 'sn',
    'username'  => 'cn',
    'member_of' => 'memberOf',
    'email'     => 'email',
  },
  Optional[String]                        $bind_password                      = undef,
  Stdlib::Absolutepath                    $conf_file                          = $::grafana::params::ldap_toml,
  Optional[Array[Grafana::LDAP::Role, 1]] $group_mappings                     = undef,
  Optional[Array[Bodgitlib::LDAP::DN, 1]] $group_search_base_dns              = undef,
  Optional[Bodgitlib::LDAP::Filter]       $group_search_filter                = undef,
  Optional[String]                        $group_search_filter_user_attribute = undef,
  Bodgitlib::Port                         $port                               = 389,
  Optional[Stdlib::Absolutepath]          $root_ca_cert                       = undef,
  Optional[Boolean]                       $ssl_skip_verify                    = undef,
  Optional[Boolean]                       $start_tls                          = undef,
  Optional[Boolean]                       $use_ssl                            = undef,
  Optional[Boolean]                       $verbose_logging                    = undef,
) inherits ::grafana::params {

  if ! defined(Class['::grafana']) {
    fail('You must include the grafana base class before using the grafana::ldap class')
  }

  contain ::grafana::ldap::config

  Class['::grafana::config'] -> Class['::grafana::ldap::config']
    ~> Class['::grafana::service']
}
