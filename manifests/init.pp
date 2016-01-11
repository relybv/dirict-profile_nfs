# == Class: profile_nfs
#
# Full description of class profile_nfs here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class profile_nfs
{
  include nfs::server

  ::nfs::server::export{ '/data_folder':
    clients => '10.0.0.0/24(rw,insecure,async,no_root_squash) localhost(rw)',
  }
}
