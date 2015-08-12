node pe-381-master {
  class { '::profiles::base': }
  package { 'jb': ensure => latest, }
}

node pe-381-agent-jenkins {
  class { '::profiles::base': }
  class { '::profiles::jenkins::master': }
}

node pe-381-agent-app {
  class { '::profiles::base': }

}

node /storage/ {
  # Ceph
  # GlusterFS
}
