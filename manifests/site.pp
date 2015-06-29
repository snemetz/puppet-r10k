node pe-381-agent-jenkins {
  Class['Epel'] -> Class['Jenkins_job_builder::Config']
  Class['Jenkins'] -> Class['Files']
  include epel
  include jenkins
  include jenkins_job_builder
  include files
  files::list{'jenkins-master':}
}
