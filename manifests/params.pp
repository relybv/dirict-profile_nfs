# == Class profile_nfs::params
#
# This class is meant to be called from profile_nfs.
# It sets variables according to platform.
#



class profile_nfs::params {
  $export_net = $::db_export_net
#   $ext_lb_fqdn = $::ext_lb_fqdn

  case $::osfamily {
    'Debian': {
      $package_name = 'profile_nfs'
      $service_name = 'profile_nfs'
    }
    'RedHat', 'Amazon': {
      $package_name = 'profile_nfs'
      $service_name = 'profile_nfs'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
