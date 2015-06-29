node pe-381-agent-jenkins {
  Class['epel'] -> Class['jenkins_job_builder']
  include epel
  include jenkins
  include jenkins_job_builder
}
