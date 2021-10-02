class profile::zip_reboot {
  if ensure_resource('package', '7zip', {'ensure' => 'present'}) { # if 7zip is installed
    reboot { 'after':
      subscribe => Package['7zip'],
    }
  }
}
