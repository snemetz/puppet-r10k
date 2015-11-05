######         ######
##  Configure R10k ##
######         ######

##  This manifest requires the zack/R10k module and will attempt to
##  configure R10k according to glarizza's blog post on directory environments.
##  Beware! (and good luck!)

# lint:ignore:global_resource
class { '::r10k':
# lint:endignore
  #version           => '1.3.2',
  sources           => {
    'puppet' => {
      #'remote'  => 'https://github.com/glarizza/puppet_repository.git',
      'remote'  => 'https://github.com/snemetz/puppet-r10k.git',
      'basedir' => "${::settings::confdir}/environments",
      'prefix'  => false,
    },
  },
  purgedirs         => ["${::settings::confdir}/environments"],
  manage_modulepath => false,
}
