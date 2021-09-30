## site.pp ##

# This file (./manifests/site.pp) is the main entry point
# used when an agent connects to a master and asks for an updated configuration.
# https://puppet.com/docs/puppet/latest/dirs_manifest.html
#
# Global objects like filebuckets and resource defaults should go in this file,
# as should the default node definition if you want to use it.

## Active Configurations ##

# Disable filebucket by default for all File resources:
# https://github.com/puppetlabs/docs-archive/blob/master/pe/2015.3/release_notes.markdown#filebucket-resource-no-longer-created-by-default
File { backup => false }

if $::kernel == 'windows' {
  Package { provider => chocolatey, }
}

## Node Definitions ##

# The default node definition matches any node lacking a more specific node
# definition. If there are no other node definitions in this file, classes
# and resources declared in the default node definition will be included in
# every node's catalog.
#
# Note that node definitions in this file are merged with node data from the
# Puppet Enterprise console and External Node Classifiers (ENC's).
#
# For more on node definitions, see: https://puppet.com/docs/puppet/latest/lang_node_definitions.html
node default {
  # This is where you can declare classes for all nodes.
  # Example:
  #   class { 'my_class': }
}

node tu-vu-1 {
 ini_setting { 'policy-based autosigning':
   setting => 'autosign',
   path    => "${confdir}/puppet.conf",
   section => 'master',
   value   => '/opt/puppetlabs/puppet/bin/autosign-validator',
   notify  => Service['pe-puppetserver'],
 }

 class { ::autosign:
   ensure => 'latest',
   config => {
     'general' => {
       'loglevel' => 'INFO',
     },
     'jwt_token' => {
       'secret'   => 'Tu2',
       'validity' => '7200',
     }
   },
 }
}

# Just testing
node tu-vu-linux {
}

# Just testing
node tu-vu-windows {
  include acl
  include registry
  include archive
  include chocolatey

  exec { 'install-chocolatey':
    command => "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))",
    provider => powershell,
  }   
}
