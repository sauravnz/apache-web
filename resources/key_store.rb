actions :configure
default_action :configure

attribute :instance_name, :kind_of => String, :required => true
attribute :keyFile, :kind_of => String, :default => 'apache.key'
attribute :crtFile, :kind_of => String, :default => 'apache.crt'
