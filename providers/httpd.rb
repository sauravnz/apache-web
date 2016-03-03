def whyrun_supported?
  true
end

use_inline_resources

action :configure do


    Chef::Log.info "Cofiguring httpd-#{new_resource.instance_name}.conf"
    #Create the custom http.conf file

      template "#{new_resource.base_dir}/apache/httpd/conf/httpd-#{new_resource.instance_name}.conf" do
        if new_resource.httpd_template
          source new_resource.httpd_template
          cookbook new_resource.cookbook_name
        else
          source "httpd.erb"
          cookbook "apache-cookbook"
        end
        owner new_resource.user
        group new_resource.group
        mode 00740
        action :create
        variables({
          :instance_name => new_resource.instance_name,
          :base_dir => new_resource.base_dir,
          :logs => new_resource.logs,
          :http_port => new_resource.http_port,
          :ssl_port => new_resource.ssl_port,
          :server_name => new_resource.server_name,
          :rotate_logs_size => new_resource.rotate_logs_size,
          :log_level => new_resource.log_level,
          :error_document => new_resource.error_document,
          :max_Clients => new_resource.max_Clients,
          :start_Servers => new_resource.start_Servers,
          :server_Limit => new_resource.server_Limit,
          :thread_Limit => new_resource.thread_Limit,
          :threads_PerChild => new_resource.threads_PerChild,
          :max_Requests_PerChild => new_resource.max_Requests_PerChild,
          :min_Spare_Threads => new_resource.min_Spare_Threads,
          :max_Spare_Threads => new_resource.max_Spare_Threads,
          :trace_Enable => new_resource.trace_Enable,
          :server_Tokens => new_resource.server_Tokens,
          :load_status_module => new_resource.load_status_module,
          :restrict_http_version => new_resource.restrict_http_version,
          :request_timeout => new_resource.request_timeout,
          :restrict_frame_options => new_resource.restrict_frame_options,
          :request_field_limit => new_resource.request_field_limit,
          :request_field_size_limit => new_resource.request_field_size_limit,
          :request_body_size_limit => new_resource.request_body_size_limit,
          :request_line_limit => new_resource.request_line_limit,
          :rotate_logs_count => new_resource.rotate_logs_count
          })
        if ::File.exists?("#{new_resource.base_dir}/apache/httpd/conf/extra/httpd-proxy.conf") ||
          ::File.exists?("#{new_resource.base_dir}/apache/httpd/conf/extra/modjk-#{new_resource.instance_name}.conf")
          notifies :restart, "service[apache-#{new_resource.instance_name}]", :delayed
        end
      end

      service "apache-#{new_resource.instance_name}" do
        action  :nothing
      end
end
