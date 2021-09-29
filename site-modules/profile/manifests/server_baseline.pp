class profile::server_baseline {
  user { 'Art Vandelay':
    ensure   => present,
    comment  => 'This is the admin user',
    name     => 'Art Vandelay',
    password => 'Chicken123!',
    groups   => ['Administrators'],
  }
  
  local_security_policy { 'Log on as a service':
    ensure       => present,
    policy_value => 'Art Vandelay',
  }

  group { 'Vandelay Industries Administrators':
    ensure  => present,
    name    => 'Vandelay Industries Administrators',
    members => ['Art Vandelay'],
  }

  file { 'c:/adminTools':
    ensure => 'directory',
  }  

  acl { 'c:/adminTools':
    target      => 'c:/adminTools',
    purge       => false,  # Read more on this 
    permissions => [
     { identity => 'Art Vandelay', rights => ['full'] },
     { identity => 'Vandelay Industries Administrators', rights => ['write', 'read'] }
    ],
  }
  
  registry::value { 'IEHarden':
    key  => 'HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap',
    type => dword,
    data => 0,
  }
  
  registry::value { 'ShutdownReasonUI':
    key  => 'HKLM\Software\Microsoft\Windows\CurrentVersion\Reliability',
    type => dword,
    data => 0,
  }
}
