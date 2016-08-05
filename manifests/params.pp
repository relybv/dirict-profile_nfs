# == Class profile_nfs::params
#
# This class is meant to be called from profile_nfs.
# It sets variables according to platform.
#



class profile_nfs::params {
  $db_export_net = $::db_export_net

notify("Dit is facter: $::db_export_net")
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
