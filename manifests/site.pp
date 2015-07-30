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
  # Add puppet-lint plugins
  package { 'lsb': ensure => latest, }
  package { 'jb': ensure => latest, }
}

node /storage/ {
  # Ceph
  # GlusterFS
}
