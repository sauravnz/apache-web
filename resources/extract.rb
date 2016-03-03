#
# Cookbook Name:: tar
# Resource:: extract

actions :extract
default_action :extract

attribute :source,       :kind_of => String, :name_attribute => true
attribute :group,        :kind_of => String, :default => 'root'
attribute :target_dir,   :kind_of => String
attribute :user,         :kind_of => String, :default => 'root'
