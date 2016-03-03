def whyrun_supported?
  true
end

use_inline_resources

action :configure do


    Chef::Log.info "Configuring /etc/init.d/apache-#{new_resource.instance_name}"

      #Creating the script for apache instnace in init.d
      template "/etc/init.d/apache-#{new_resource.instance_name}" do
        if new_resource.service_template
          source new_resource.service_template
        else
          source "service.erb"
          cookbook "apache-cookbook"
        end
        owner "root"
        group "root"
        mode 00740
        action :create
        variables({
          :instance_name => new_resource.instance_name,
          :base_dir => new_resource.base_dir
          })
        end

    #Configure the apache instance script to appropreate run levels
    bash "configure-service-#{new_resource.instance_name}" do
      cwd "/etc/init.d"
      user "root"
      code <<-EOF
      chkconfig --add apache-#{new_resource.instance_name}
      EOF
      not_if "chkconfig --list|grep apache-#{new_resource.instance_name}"
    end

    service "apache-#{new_resource.instance_name}" do
      action  :enable
    end
end

action :start do

  startservice("apache-#{new_resource.instance_name}")

end

action :stop do

  stopservice("apache-#{new_resource.instance_name}")

end

action :restart do

  restartservice("apache-#{new_resource.instance_name}")

end


def startservice(instance_name)
  service instance_name do
    action :start
  end
end

def stopservice(instance_name)
  service instance_name do
    action :stop
    only_if "ps -aef|grep httpd-#{new_resource.instance_name}|grep -v grep"
  end
end

def restartservice(instance_name)
  stopservice(instance_name)
  startservice(instance_name)
end
