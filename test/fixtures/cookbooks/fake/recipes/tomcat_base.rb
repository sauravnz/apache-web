#
# Cookbook Name:: fake
# Recipe:: base
#
# Copyright 2014, Target
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'tomcat-cookbook::default'

tomcat_cookbook_base 'Installing Base Tomcat' do
  base_dir '/apps/install'
  tmp_dir '/apps/tmp'
  log_dir '/apps/logs'
  version '7.0.59'
  apr_version '1.5.1'
  openssl_version '1.0.1i'
  tomcat_native_version '1.1.31'
  tomcat_src 'https://binrepo.target.com/artifactory/simple/infra-automation/tomcat/apache-tomcat/7.0.59.tar/apache-tomcat-7.0.59.tar.gz'
  apr_src 'https://binrepo.target.com/artifactory/simple/infra-automation/apache/apr/1.5.1.tar/apr-1.5.1.tar.gz'
  openssl_src 'https://binrepo.target.com/artifactory/simple/infra-automation/apache/openssl/1.0.1i.tar/openssl-1.0.1i.tar.gz'
  native_src 'https://binrepo.target.com/artifactory/simple/infra-automation/tomcat/tomcat-native/1.1.31/tomcat-native-1.1.31-src.tar.gz'
  action :install
end
