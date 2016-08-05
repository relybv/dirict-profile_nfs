# == Class: profile_nfs
#
# Full description of class profile_nfs here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.



class profile_nfs(
    $export_net = $::profile_nfs::params::export_net
  )
{
  class { '::nfs::server':
    nfs_v4             => true,
    nfs_v4_export_root => '/mnt/nfs',
  }

  ::nfs::server::export{ '/mnt/nfs':
    clients => "${export_net}(rw,sync,no_root_squash,no_subtree_check) localhost(rw,sync,no_root_squash,no_subtree_check)",
  }
  ::nfs::server::export{ '/mnt/nfs/config':
    clients => "${export_net}(rw,sync,no_root_squash,no_subtree_check) localhost(rw,sync,no_root_squash,no_subtree_check)",
  }
  ::nfs::server::export{ '/mnt/nfs/office-templates':
    clients => "${export_net}(rw,sync,no_root_squash,no_subtree_check) localhost(rw,sync,no_root_squash,no_subtree_check)",
  }
  ::nfs::server::export{ '/mnt/nfs/errors':
    clients => "${export_net}(rw,sync,no_root_squash,no_subtree_check) localhost(rw,sync,no_root_squash,no_subtree_check)",
  }
  ::nfs::server::export{ '/mnt/nfs/logs':
    clients => "${export_net}(rw,sync,no_root_squash,no_subtree_check) localhost(rw,sync,no_root_squash,no_subtree_check)",
  }

}
