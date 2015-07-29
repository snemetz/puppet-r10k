node pe-381-agent-jenkins {
  # Jenkins Server
  Class['Epel'] -> Class['Jenkins_job_builder::Config']
  Class['Jenkins'] -> Class['Files']
  include epel
  include jenkins
  include jenkins_job_builder
  include files
  files::list{'jenkins-master':}
  package { 'graphviz': ensure => latest, }
  # Jenkins Slaves
  package { 'puppet-lint':
    ensure   => latest,
    provider => 'pe_gem',
  }
  package { 'lsb': ensure => latest, }
  # Add puppet-lint plugins
}

node /storage/ {
  # Ceph
  # GlusterFS
}
