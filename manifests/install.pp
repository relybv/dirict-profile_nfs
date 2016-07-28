# == Class profile_nfs::install
#
# This class is called from profile_nfs for install.
#
class profile_nfs::install {
  # prevent direct use of subclass
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  package { $::profile_nfs::package_name:
    ensure => present,
  }
}
