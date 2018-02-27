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

  notice("Running with db_export_net ${db_export_net}")

  exec { 'prep_dirs':
    command => '/bin/mkdir -p /mnt/nfs/config /mnt/nfs/office-templates /mnt/nfs/errors /mnt/nfs/logs /mnt/nfs/data /mnt/nfs/data/cache /mnt/nfs/data/tmp',
  }
  class { '::nfs':
    server_enabled     => true,
    nfs_v4             => true,
    nfs_v4_export_root => '/mnt/nfs',
    require            => File['/mnt/nfs/data'],
  }
  file { '/mnt/nfs/config':
    ensure  => directory,
    require => Exec['prep_dirs'],
  }
  file { '/mnt/nfs/office-templates':
    ensure  => directory,
    require => Exec['prep_dirs'],
  }
  file { '/mnt/nfs/errors':
    ensure  => directory,
    require => Exec['prep_dirs'],
  }
  file { '/mnt/nfs/logs':
    ensure  => directory,
    require => Exec['prep_dirs'],
  }
  file { '/mnt/nfs/data':
    ensure  => directory,
    require => Exec['prep_dirs'],
  }
  file { '/mnt/nfs/data/cache':
    ensure  => directory,
    require => Exec['prep_dirs'],
  }
  file { '/mnt/nfs/data/tmp':
    ensure  => directory,
    require => Exec['prep_dirs'],
  }

  ::nfs::server::export{ '/mnt/nfs':
    clients => "${db_export_net}(rw,sync,no_root_squash,no_subtree_check) localhost(rw,sync,no_root_squash,no_subtree_check)",
    require => File['/mnt/nfs'],
  }
  ::nfs::server::export{ '/mnt/nfs/config':
    clients => "${db_export_net}(rw,sync,no_root_squash,no_subtree_check) localhost(rw,sync,no_root_squash,no_subtree_check)",
    require => File['/mnt/nfs/config'],
  }
  ::nfs::server::export{ '/mnt/nfs/office-templates':
    clients => "${db_export_net}(rw,sync,no_root_squash,no_subtree_check) localhost(rw,sync,no_root_squash,no_subtree_check)",
    require => File['/mnt/nfs/office-templates'],
  }
  ::nfs::server::export{ '/mnt/nfs/errors':
    clients => "${db_export_net}(rw,sync,no_root_squash,no_subtree_check) localhost(rw,sync,no_root_squash,no_subtree_check)",
    require => File['/mnt/nfs/errors'],
  }
  ::nfs::server::export{ '/mnt/nfs/logs':
    clients => "${db_export_net}(rw,sync,no_root_squash,no_subtree_check) localhost(rw,sync,no_root_squash,no_subtree_check)",
    require => File['/mnt/nfs/logs'],
  }
  ::nfs::server::export{ '/mnt/nfs/data/cache':
    clients => "${db_export_net}(rw,sync,no_root_squash,no_subtree_check) localhost(rw,sync,no_root_squash,no_subtree_check)",
    require => File['/mnt/nfs/data/cache'],
  }
  ::nfs::server::export{ '/mnt/nfs/data/tmp':
    clients => "${db_export_net}(rw,sync,no_root_squash,no_subtree_check) localhost(rw,sync,no_root_squash,no_subtree_check)",
    require => File['/mnt/nfs/data/tmp'],
  }

}
