def whyrun_supported?
  true
end

use_inline_resources

action :configure do


    Chef::Log.info "Cofiguring Modjk-#{new_resource.instance_name}.conf"

    #Create the custom modjk property file for each instance_name

      template "#{node['apache']['base_dir']}/apache/httpd/conf/extra/modjk-#{new_resource.instance_name}.conf" do
        if new_resource.modjk_template
          source new_resource.modjk_template
        else
          source "modjk.erb"
          cookbook "apache-cookbook"
        end
        owner "root"
        group "root"
        mode 00740
        action :create
        variables({
          :instance_name => new_resource.instance_name,
          :context_path_name => new_resource.context_path_name,
          :base_dir => new_resource.base_dir,
          :logs => new_resource.logs,
          :modjk_log_level => new_resource.modjk_log_level,
          :rotate_logs_size => new_resource.rotate_logs_size,
          :ssl_port => new_resource.ssl_port
          })
          if ::File.exists?("/etc/init.d/apache-#{new_resource.instance_name}")
            notifies :restart, "service[apache-#{new_resource.instance_name}]", :delayed
          end
      end




    Chef::Log.info "Configuring workers-#{new_resource.instance_name}.properties"

    #Create the custom worker property file for each instance_name

      template "#{node['apache']['base_dir']}/apache/httpd/conf/workers-#{new_resource.instance_name}.properties" do
        if new_resource.worker_template
          source new_resource.worker_template
        else
          source "workers.erb"
          cookbook "apache-cookbook"
        end
        owner "root"
        group "root"
        mode 00740
        action :create
        variables({
          :instance_name => new_resource.instance_name,
          :workers => new_resource.workers
          })
          if ::File.exists?("/etc/init.d/apache-#{new_resource.instance_name}")
            notifies :restart, "service[apache-#{new_resource.instance_name}]", :delayed
          end
    end

    service "apache-#{new_resource.instance_name}" do
      action [:nothing]
    end
end
