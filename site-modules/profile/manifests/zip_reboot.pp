class profile::zip_reboot {
  # Just to test before figuring out a conditional for this
  reboot { 'after':
    subscribe => Package['7zip'],
  }
}
