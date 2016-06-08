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
  class { '::nfs':
    server_nfsv4_servicehelper => 'nfs-common',
    server_enabled             => true,
    nfs_v4                     => true,
    nfs_v4_export_root         => '/mnt/nfs',
  }

  exec { '/bin/mkdir /mnt/nfs /mnt/nfs/config /mnt/nfs/office-templates /mnt/nfs/errors /mnt/nfs/logs':
    creates => '/mnt/nfs/logs',
  }

  ::nfs::server::export{ '/mnt/nfs':
    clients => '172.16.0.0/16(rw,sync,no_root_squash,no_subtree_check) localhost(rw,sync,no_root_squash,no_subtree_check)',
  }
  ::nfs::server::export{ '/mnt/nfs/config':
    clients => '172.16.0.0/16(rw,sync,no_root_squash,no_subtree_check) localhost(rw,sync,no_root_squash,no_subtree_check)',
  }
  ::nfs::server::export{ '/mnt/nfs/office-templates':
    clients => '172.16.0.0/16(rw,sync,no_root_squash,no_subtree_check) localhost(rw,sync,no_root_squash,no_subtree_check)',
  }
  ::nfs::server::export{ '/mnt/nfs/errors':
    clients => '172.16.0.0/16(rw,sync,no_root_squash,no_subtree_check) localhost(rw,sync,no_root_squash,no_subtree_check)',
  }
  ::nfs::server::export{ '/mnt/nfs/logs':
    clients => '172.16.0.0/16(rw,sync,no_root_squash,no_subtree_check) localhost(rw,sync,no_root_squash,no_subtree_check)',
  }

}
