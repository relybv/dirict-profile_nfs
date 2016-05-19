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

  ::nfs::server::export{ '/mnt/nfs':
    clients => '172.16.0.0/16(rw,sync,no_root_squash,no_subtree_check)',
  }
}
