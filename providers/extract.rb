#
# Cookbook Name:: tomcat-cookbook
# Provider:: extract


action :extract do

# My state has changed so I'd better notify observers
  new_resource.updated_by_last_action(true)

  basename = ::File.basename(new_resource.name)

  execute "extract #{basename}" do
    command "tar -zvxf #{new_resource.name}"
    cwd new_resource.target_dir
    group  new_resource.group
    user   new_resource.user
  end
end
