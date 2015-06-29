node pe-381-agent-jenkins {
  Class['Epel'] -> Class['Jenkins_job_builder::Config']
  include epel
  include jenkins
  include jenkins_job_builder
}
