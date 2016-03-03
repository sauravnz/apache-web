#
# Cookbook Name:: tomcat-cookbook
# Provider:: fixpermission


action :fixpermission do
# My state has changed so I'd better notify observers
  new_resource.updated_by_last_action(true)

if new_resource.recursive == true
recursive = "-R"
else
recursive = ""
end
	execute "Fixing owner & group for #{new_resource.name}" do
		command "chown #{recursive} #{new_resource.user}:#{new_resource.group} #{new_resource.name}"
		group  "root"
		user   "root"
	end
	execute "Fixing permission for #{new_resource.name}" do
		command "chmod #{recursive} #{new_resource.mode} #{new_resource.name}"
		group  "root"
		user   "root"
	end
end
