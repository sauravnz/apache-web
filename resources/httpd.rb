actions :configure
default_action :configure

attribute :instance_name, :kind_of => String, :required => true
attribute :httpd_template, :kind_of => String, :default => nil
attribute :user, :kind_of => String, :default => 'apache'
attribute :group, :kind_of => String, :default => 'apache'
attribute :base_dir, :kind_of => String, :default => node['apache']['base_dir']
attribute :logs, :kind_of => String, :default => node['apache']['logs']
attribute :http_port, :kind_of => String, :default => '80'
attribute :ssl_port, :kind_of => String, :default => '443'
attribute :server_name, :kind_of => String, :default => 'localhost'
attribute :rotate_logs_size, :kind_of => String, :default => '20M'
attribute :log_level, :kind_of => String, :default => 'debug'
attribute :error_document, :kind_of => Hash, :default => { 401 => 'Unauthorized', 404 => 'Page Not Found', 500 => 'Internal Server Error', 503 => 'Service Unavailable' }
attribute :max_Clients, :kind_of => String, :default => '10584'
attribute :start_Servers, :kind_of => String, :default => '1'
attribute :server_Limit, :kind_of => String, :default => '7'
attribute :thread_Limit, :kind_of => String, :default => '1512'
attribute :threads_PerChild, :kind_of => String, :default => '1512'
attribute :max_Requests_PerChild, :kind_of => String, :default => '100000'
attribute :min_Spare_Threads, :kind_of => String, :default => '1'
attribute :max_Spare_Threads, :kind_of => String, :default => '1512'
attribute :trace_Enable, :kind_of => String, :default => 'off'
attribute :server_Tokens, :kind_of => String, :default => 'prod'
attribute :load_status_module, :kind_of => [TrueClass, FalseClass], :default => true
attribute :restrict_http_version, :kind_of => [TrueClass, FalseClass], :default => false
attribute :request_timeout, :kind_of => Integer, :default => 300
attribute :restrict_frame_options, :kind_of => [TrueClass, FalseClass], :default => false
attribute :request_field_limit, :kind_of => Integer, :default => 100
attribute :request_field_size_limit, :kind_of => Integer, :default => 8190
attribute :request_body_size_limit, :kind_of => Integer, :default => 102_400
attribute :request_line_limit, :kind_of => Integer, :default => 8190
attribute :rotate_logs_count, :kind_of => Integer, :default => 10
attribute :cookbook_name, :kind_of => String, :default => 'apache-cookbook'
