class profile::website {
  $websiteDir = 'C:/website'
  $websiteLocation = "${websiteDir}/index.html"

  # Make sure that websiteDir is there
  file { $websiteDir:
    ensure  => directory,
  } 

  file { "${websiteDir}/index.html":
    ensure => present,
    source => 'puppet:///modules/profile/index.html',  
  }

  iis_site { 'testing-site':
    ensure          => 'started',
    physicalpath    => $websiteDir,    
    applicationpool => 'DefaultAppPool',
    require         => [
      File["${websiteDir}/index.html"],
      Iis_site['Default Web Site'],
    ]     
  }
  
}
