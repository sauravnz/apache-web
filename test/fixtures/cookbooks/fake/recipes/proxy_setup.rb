#
# Cookbook Name:: fake
# Recipe:: instance
#
# Copyright 2014, TTS-OO-InfrAautomation
#

apache_cookbook_init_service 'Service Configuration' do
  instance_name node['apache']['instance_name']
  action :configure
end

apache_cookbook_key_store 'Certificate and Key Configuration' do
  instance_name node['apache']['instance_name']
  keyFile node['apache']['keyFile']
  crtFile node['apache']['crtFile']
  action :configure
end

apache_cookbook_httpd 'Httpd Configuration' do
  instance_name node['apache']['instance_name']
  action :configure
end

apache_cookbook_httpd_proxy 'Proxy Module Configuration' do
  instance_name node['apache']['instance_name']
  action :configure
end