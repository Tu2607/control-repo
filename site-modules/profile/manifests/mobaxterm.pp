class profile::mobaxterm {
  $mobaInstallerDir = 'c:\users\public\downloads'
  $packageName = 'MobaXterm_installer_v21.3.msi' 
  $archiveName = 'MobaXterm_Installer_v21.3.zip'

  # Ensure that the mobaInstallerDir is there
  file { $mobaInstallerDir:
    ensure => present,
  }

  # Download the MobaXterm Zip
  archive { "${mobaInstallerDir}\${archiveName}":
    ensure       => present,
    extract      => true,
    extract_path => $mobaInstallerDir,
    source       => 'https://download.mobatek.net/2132021082033134/MobaXterm_Installer_v21.3.zip', 
  }

  # Install MobaXterm
  package { 'MobaXterm':
    ensure => present,
    source => "${mobaInstallerDir}\${packageName}",
  }
}
