node pe-381-master {
  class { '::profiles::base': }
  package { 'jq': ensure => latest, }
}

node pe-381-agent-jenkins {
  class { '::profiles::base': }
  class { '::profiles::jenkins::master': }
}

node pe-381-agent-app {
  class { '::profiles::base': }
  #class { '::profiles::haproxy': }
  #class { '::profiles::kafka': }
  class { '::profiles::flume': }

}

node /storage/ {
  # Ceph
  # GlusterFS
}
