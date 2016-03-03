actions :configure
default_action :configure

attribute :instance_name, :kind_of => String, :required => true
attribute :context_path_name, :kind_of => Array, :required => true
attribute :base_dir, :kind_of => String, :default => node['apache']['base_dir']
attribute :logs, :kind_of => String, :default => node['apache']['logs']
attribute :modjk_template, :kind_of => String, :default => nil
attribute :worker_template, :kind_of => String, :default => nil
attribute :workers, :kind_of => Hash, :required => true
attribute :ssl_port, :kind_of => String, :default => '443'
attribute :cookbook_name, :kind_of => String, :default => 'apache-cookbook'
attribute :modjk_log_level, :kind_of => String, :default => 'debug'
attribute :rotate_logs_size, :kind_of => String, :default => '20M'
