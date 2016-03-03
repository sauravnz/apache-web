#
# Cookbook Name:: commons
# Resource:: fixpermission

actions :fixpermission
default_action :fixpermission

attribute :path,  		 :kind_of => String, :name_attribute => true
attribute :group,        :kind_of => String
attribute :target_dir,   :kind_of => String
attribute :user,         :kind_of => String
attribute :mode,         :kind_of => String
attribute :recursive,    :kind_of => [TrueClass, FalseClass], :default => true
