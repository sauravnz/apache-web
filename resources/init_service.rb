actions :configure, :start, :stop, :restart
default_action :configure

attribute :instance_name, :kind_of => String, :required => true
attribute :service_template, :kind_of => String, :default => nil
attribute :base_dir, :kind_of => String, :default => node['apache']['base_dir']
