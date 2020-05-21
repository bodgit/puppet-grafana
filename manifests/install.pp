#
class grafana::install {

  if $::grafana::manage_repo {
    case $::osfamily {
      'RedHat': {
        yumrepo { 'grafana':
          baseurl       => 'https://packages.grafana.com/oss/rpm/',
          descr         => 'grafana',
          repo_gpgcheck => true,
          enabled       => true,
          gpgcheck      => true,
          gpgkey        => 'https://packages.grafana.com/gpg.key',
          sslverify     => true,
          before        => Package[$::grafana::package_name],
        }
      }
      default: {
        fail('')
      }
    }
  }

  package { $::grafana::package_name:
    ensure => present,
  }
}
