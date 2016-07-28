# == Class profile_nfs::config
#
# This class is called from profile_nfs for service config.
#
class profile_nfs::config {
  # prevent direct use of subclass
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }
}
