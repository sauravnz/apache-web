actions :configure
default_action :configure

attribute :instance_name, :kind_of => String, :required => true
attribute :logs, :kind_of => String, :default => node['apache']['logs']
attribute :ssl_port, :kind_of => String, :default => '443'
attribute :rotate_logs_size, :kind_of => String, :default => '20M'
attribute :base_dir, :kind_of => String, :default => node['apache']['base_dir']
attribute :proxy_template, :kind_of => String, :default => nil
attribute :user, :kind_of => String, :default => 'apache'
attribute :group, :kind_of => String, :default => 'apache'
attribute :rotate_logs_count, :kind_of => Integer, :default => 10
