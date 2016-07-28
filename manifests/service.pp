# == Class profile_nfs::service
#
# This class is meant to be called from profile_nfs.
# It ensure the service is running.
#
class profile_nfs::service {
  # prevent direct use of subclass
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  service { $::profile_nfs::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
