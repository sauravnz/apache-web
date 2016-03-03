actions :install, :upgrade
default_action :install

# base directories
attribute :base_dir, :kind_of => String, :default => node['apache']['base_dir']
attribute :tmp_dir, :kind_of => String, :default => node['apache']['tmp_dir']
attribute :logs, :kind_of => String, :default => node['apache']['logs']
attribute :mpm, :kind_of => String, :default => node['apache']['mpm']

# user and group details
attribute :group, :kind_of => String, :default => node['apache']['group']
attribute :gid, :kind_of => String, :default => node['apache']['gid']
attribute :user, :kind_of => String, :default => node['apache']['user']
attribute :uid, :kind_of => String, :default => node['apache']['uid']
attribute :usr_home, :kind_of => String, :default => node['apache']['usr_home']
attribute :usr_shell, :kind_of => String, :default => node['apache']['usr_shell']

# source versions
attribute :apr_version, :kind_of => String, :required => true
attribute :apr_util_version, :kind_of => String, :required => true
attribute :pcre_version, :kind_of => String, :required => true
attribute :openssl_version, :kind_of => String, :required => true
attribute :httpd_version, :kind_of => String, :required => true
attribute :modjk_version, :kind_of => String, :required => true

# Source URLS
attribute :apr_src, :kind_of => String, :required => true
attribute :apr_util_src, :kind_of => String, :required => true
attribute :pcre_src, :kind_of => String, :required => true
attribute :openssl_src, :kind_of => String, :required => true
attribute :httpd_src, :kind_of => String, :required => true
attribute :modjk_src, :kind_of => String, :required => true
