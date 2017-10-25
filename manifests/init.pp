#
class grafana (
  String[1]                   $admin_password,
  String[1]                   $secret_key,
  String                      $admin_user         = $::grafana::params::admin_user,
  Optional[Boolean]           $allow_sign_up      = undef,
  Optional[Boolean]           $allow_org_create   = undef,
  Optional[Boolean]           $check_for_updates  = $::grafana::params::check_for_updates,
  Stdlib::Absolutepath        $conf_dir           = $::grafana::params::conf_dir,
  Stdlib::Absolutepath        $conf_file          = $::grafana::params::conf_file,
  Stdlib::Absolutepath        $data_dir           = $::grafana::params::data_dir,
  Optional[Grafana::Database] $database           = undef,
  Stdlib::Absolutepath        $grafana_home       = $::grafana::params::grafana_home,
  String                      $group              = $::grafana::params::group,
  Stdlib::Absolutepath        $log_dir            = $::grafana::params::log_dir,
  Boolean                     $manage_repo        = $::grafana::params::manage_repo,
  Optional[Integer[0]]        $max_idle_conn      = undef,
  Optional[Integer[0]]        $max_open_conn      = undef,
  Integer[0]                  $max_open_files     = $::grafana::params::max_open_files,
  String                      $package_name       = $::grafana::params::package_name,
  Stdlib::Absolutepath        $plugins_dir        = $::grafana::params::plugins_dir,
  Boolean                     $restart_on_upgrade = $::grafana::params::restart_on_upgrade,
  String                      $service_name       = $::grafana::params::service_name,
  Optional[String]            $url                = $::grafana::params::url,
  String                      $user               = $::grafana::params::user,
) inherits ::grafana::params {

  contain ::grafana::install
  contain ::grafana::config
  contain ::grafana::service

  Class['::grafana::install'] ~> Class['::grafana::config']
    ~> Class['::grafana::service']
}
