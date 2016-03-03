#
# Cookbook Name:: fake
# Recipe:: default
#
# Copyright 2014, Target
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'lvm'

node['storage']['volumes'].each do |volume_name, volume|
  # TODO: validate the entry of the volume in fstab, if already present then remove it before creating the volume
  # this can happen if the volume is mannualy deleted but the entry from fstab is not removed

  # Create Logical volume
  lvm_logical_volume volume_name do
    group volume['group']
    size volume['size']
    filesystem volume['filesystem']
    mount_point volume['mount']
    mount_point :location => volume['mount'], :options => 'defaults', :dump => 1, :pass => 2
  end
end
