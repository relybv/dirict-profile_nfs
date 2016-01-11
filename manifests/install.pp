# == Class profile_nfs::install
#
# This class is called from profile_nfs for install.
#
class profile_nfs::install {

  package { $::profile_nfs::package_name:
    ensure => present,
  }
}
