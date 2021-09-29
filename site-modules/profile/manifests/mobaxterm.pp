/*
class profile::mobaxterm {
  # Interesting note here: If the execution is procedural,
  # then 'C:\adminTools exists since the user Art Vandelay is created

  $mobaInstallerDir = 'c:\adminTools'
  
  # Ensure that adminTools is there
  file { $mobeInstallerDir:
    ensure => present,
  }

  # Download the MobaXterm Zip
  archive { 'mobaTerm':
    ensure       => present,
    extract      => true,
    extract_path => $mobaInstallerDir,
    source       => 'https://download.mobatek.net/2132021082033134/MobaXterm_Installer_v21.3.zip', 
    cleanup      => true,
  }

  # Install MobaXterm
  package { 'mobaXterm':
    
  }
}
*/
