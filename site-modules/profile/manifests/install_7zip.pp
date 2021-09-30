class profile::install_7zip {
  package { '7zip':
    ensure   => installed,
    provider => 'chocolatey',
    require  => Exec['install-chocolatey'],
  }
}
