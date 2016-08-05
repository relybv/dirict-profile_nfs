# == Class: profile_nfs
#
# Full description of class profile_nfs here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.



class profile_nfs(
    $db_export_net = $::profile_nfs::params::db_export_net
  ) inherits ::profile_nfs::params {

  class { '::nfs::server':
    nfs_v4             => true,
    nfs_v4_export_root => '/mnt/nfs',
  }

  ::nfs::server::export{ '/mnt/nfs':
    clients => "${db_export_net}(rw,sync,no_root_squash,no_subtree_check) localhost(rw,sync,no_root_squash,no_subtree_check)",
  }
  ::nfs::server::export{ '/mnt/nfs/config':
    clients => "${db_export_net}(rw,sync,no_root_squash,no_subtree_check) localhost(rw,sync,no_root_squash,no_subtree_check)",
  }
  ::nfs::server::export{ '/mnt/nfs/office-templates':
    clients => "${db_export_net}(rw,sync,no_root_squash,no_subtree_check) localhost(rw,sync,no_root_squash,no_subtree_check)",
  }
  ::nfs::server::export{ '/mnt/nfs/errors':
    clients => "${db_export_net}(rw,sync,no_root_squash,no_subtree_check) localhost(rw,sync,no_root_squash,no_subtree_check)",
  }
  ::nfs::server::export{ '/mnt/nfs/logs':
    clients => "${db_export_net}(rw,sync,no_root_squash,no_subtree_check) localhost(rw,sync,no_root_squash,no_subtree_check)",
  }

}
