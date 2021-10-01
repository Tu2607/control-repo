class profile::webservers {
  $iis_features = ['Web-WebServer', 'Web-Scripting-Tools']

  iis_feature { $iis_features:
    ensure => present,
  }
 
  iis_site { 'Default Web Site':
    ensure  => 'absent',
    require => Iis_feature['Web-WebServer'],
  } 
}
