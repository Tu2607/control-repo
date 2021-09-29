class profile::server_baseline {
  #include acl  # Not sure about this yet
  #include registry  # Not sure about this yet too

  user { 'Art Vandelay':
    ensure  => present,
    comment => 'This is the admin user',
    name    => 'Art Vandelay',
    groups  => ['Administrator'],
    # Still need to grant my user the 'log on as a service' 
  }
  
  group { 'Vandelay Industries Administrators':
    ensure  => present,
    name    => 'Vandelay Industries Administrators',
    members => ['Art Vandelay']
  }

  file { 'C:/adminTools':
    path   => 'C:/adminTools',
    ensure => 'directory',
  }  

/*
  acl { 'C:/adminTools':
    target      => 'C:/adminTools',
    purge       => false,  # Read more on this 
    permissions => [
     { identity => 'Art Vandelay', rights => ['full'] },
     { identity => 'Vandelay Industries Administrators', rights => ['write', 'read'] }
    ],
  }
  
  registry::value { 'IEHarden':
    key  => 'HKLM\Software\Microsoft\Windows\CurrentVersion\InternetSettings\ZoneMap',
    type => dword,
    data => 0
  }
  
  registry::value { 'ShutdownReasonUI':
    key  => 'HKLM\Software\Microsoft\Windows\CurrentVersion\Reliability',
    type => dword,
    data => 0
  }
*/
}
