#
# Cookbook Name:: fake
# Recipe:: base
#
# Copyright 2014, Target
#
# All rights reserved - Do Not Redistribute
#

# Install base tomcat with standard TCOM configuration

tomcat_cookbook_instance 'tomcat01' do
  base_dir '/apps/install'
  tmp_dir '/apps/tmp'
  version '7.0.59'
  log_dir '/apps/logs/tomcat'
  log_level 'INFO'
  tomcat_src 'https://binrepo.target.com/artifactory/simple/infra-automation/tomcat/apache-tomcat/7.0.59.tar/apache-tomcat-7.0.59.tar.gz'
  tomcat_home '/apps/tomcat'
  shutdown_port 8005
  http_port 8080
  ssl_port 8044
  ajp_port 8006
  dc_identifier 'TTCE'
  app_name 'sample'
  war_file 'sample.war'
  enable_rotate true
  action :create
end

remote_file '/apps/install/tomcat7/webapps/sample.war' do
  source 'https://binrepo.target.com/artifactory/simple/infra-automation/tomcat/sample/sample.war'
  owner node['tomcat_tgtcfg']['user']
  group node['tomcat_tgtcfg']['group']
  mode 0755
  action :create_if_missing
  notifies :restart, 'service[tomcat01]', :immediately
end

service 'tomcat01' do
  action :nothing
end
