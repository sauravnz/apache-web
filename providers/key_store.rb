def whyrun_supported?
  true
end

use_inline_resources

action :configure do

    # key and Self Signed cert configuration for apache
    bash "Create #{new_resource.instance_name} Key" do
      cwd "#{node['apache']['base_dir']}/apache/httpd/certificates"
      user "root"
      code <<-EOF
      openssl genrsa -des3 -passout pass:x -out server.pass.key 2048
      openssl rsa -passin pass:x -in server.pass.key -out #{new_resource.instance_name}.key
      rm server.pass.key
      EOF
      not_if {::File.exists?("#{node['apache']['base_dir']}/apache/httpd/certificates/#{new_resource.instance_name}.key")}
    end

    bash "Create #{new_resource.instance_name} Cert" do
      cwd "#{node['apache']['base_dir']}/apache/httpd/certificates"
      user "root"
      code <<-EOF
      openssl req \
      -new \
      -key #{new_resource.instance_name}.key \
      -days 365 \
      -nodes \
      -x509 \
      -subj "/C=US/ST=MN/L=Minneapolis/O=Dis/CN=www.example.com" \
      -out #{new_resource.instance_name}.crt
      EOF
      not_if {::File.exists?("#{node['apache']['base_dir']}/apache/httpd/certificates/#{new_resource.instance_name}.crt")}
    end
end
