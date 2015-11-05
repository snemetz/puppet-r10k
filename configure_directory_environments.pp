######                           ######
##  Configure Directory Environments ##
######                           ######

##  This manifest requires the puppetlabs/inifile module and will attempt to
##  configure puppet.conf according to the blog post on using R10k and
##  directory environments.  Beware!

# Default for ini_setting resources:
Ini_setting {
  ensure => present,
  path   => "${::settings::confdir}/puppet.conf",
  # notify => Exec['trigger_r10k'],
}

# lint:ignore:global_resource
ini_setting { 'Configure environmentpath':
# lint:endignore
  section => 'main',
  setting => 'environmentpath',
  value   => '$confdir/environments',
}

# lint:ignore:global_resource
ini_setting { 'Configure basemodulepath':
# lint:endignore
  section => 'main',
  setting => 'basemodulepath',
  value   => '$confdir/modules:/opt/puppet/share/puppet/modules',
}

# lint:ignore:global_resource
exec { 'trigger_r10k':
# lint:endignore
  command     => 'r10k deploy environment -p',
  # lint:ignore:80chars
  path        => '/opt/puppet/bin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin',
  # lint:endignore
  refreshonly => true,
}
