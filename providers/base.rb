def whyrun_supported?
  true
end

use_inline_resources


action :install do


  @apr=::File.basename(new_resource.apr_src, ".tar.gz")
  @apr_util=::File.basename(new_resource.apr_util_src, ".tar.gz")
  @pcre=::File.basename(new_resource.pcre_src, ".tar.gz")
  @openssl=::File.basename(new_resource.openssl_src, ".tar.gz")
  @httpd=::File.basename(new_resource.httpd_src, ".tar.gz")
  @modjk=::File.basename(new_resource.modjk_src, ".tar.gz")

  # My state has changed so I'd better notify observers
  new_resource.updated_by_last_action(true)

  #Pre Install tasks for apache
  pre_install

  # Install Tomcat base
  install_apr(@apr)

  # Install Apr
  install_apr_util(@apr_util)

  # Install pcre
  install_pcre(@pcre)

  # Install Openssl
  install_openssl(@openssl)

  # Install httpd
  install_httpd(@httpd)

  # Install modjk
  install_modjk(@modjk)

  #Post Install tasks for apache
  post_install(@apr, @apr_util, @pcre, @openssl, @httpd, @modjk)


end

action :upgrade do

  @apr=::File.basename(new_resource.apr_src, ".tar.gz")
  @apr_util=::File.basename(new_resource.apr_util_src, ".tar.gz")
  @pcre=::File.basename(new_resource.pcre_src, ".tar.gz")
  @openssl=::File.basename(new_resource.openssl_src, ".tar.gz")
  @httpd=::File.basename(new_resource.httpd_src, ".tar.gz")
  @modjk=::File.basename(new_resource.modjk_src, ".tar.gz")

  # Upgrade Tomcat base
  remove_apr(@apr)

  # Upgrade Apr
  remove_apr_util(@apr_util)

  # Upgrade pcre
  remove_pcre(@pcre)

  # Upgrade Openssl
  remove_openssl(@openssl)

  # Upgrade httpd & modjk
  remove_httpd_modjk(@httpd, @modjk)

  #Pre Install tasks for apache
  pre_install

  # Install Tomcat base
  install_apr(@apr)

  # Install Apr
  install_apr_util(@apr_util)

  # Install pcre
  install_pcre(@pcre)

  # Install Openssl
  install_openssl(@openssl)

  # Install httpd
  install_httpd(@httpd)

  # Install modjk
  install_modjk(@modjk)

  #Post Install tasks for apache
  post_install(@apr, @apr_util, @pcre, @openssl, @httpd, @modjk)



end

def remove_apr(apr)

  file = ::File.open("#{new_resource.base_dir}/apr/apr-version.txt", "rb")
  ver_on_box = file.read
  log "apr_version requested : #{new_resource.apr_version}"
  log "apr_version on box : #{ver_on_box}"

  if new_resource.apr_version != ver_on_box.gsub("\n",'')
    log "Begin Update to #{apr}"

    log "Removing the apr directories"
    directory "#{new_resource.base_dir}/apr" do
      recursive true
      action :delete
    end
  else
    log "No change in apr_version, nothing to do.."
  end

end

def remove_apr_util(apr_util)

  file = ::File.open("#{new_resource.base_dir}/apr-util/apr_util-version.txt", "rb")
  ver_on_box = file.read
  log "apr_util_version requested : #{new_resource.apr_util_version}"
  log "apr_util_version on box : #{ver_on_box}"

  if new_resource.apr_util_version != ver_on_box.gsub("\n",'')
    log "Begin Update to #{apr_util}"

    log "Removing the apr_util directories"
    directory "#{new_resource.base_dir}/apr_util" do
      recursive true
      action :delete
    end
  else
    log "No change in apr_util_version, nothing to do.."
  end

end

def remove_pcre(pcre)

  file = ::File.open("#{new_resource.base_dir}/pcre/pcre-version.txt", "rb")
  ver_on_box = file.read
  log "pcre_version requested : #{new_resource.pcre_version}"
  log "pcre_version on box : #{ver_on_box}"

  if new_resource.pcre_version != ver_on_box.gsub("\n",'')
    log "Begin Update to #{pcre}"

    log "Removing the pcre directories"
    directory "#{new_resource.base_dir}/pcre" do
      recursive true
      action :delete
    end
  else
    log "No change in pcre_version, nothing to do.."
  end


end

def remove_openssl(openssl)

  file = ::File.open("#{new_resource.base_dir}/openssl/openssl-version.txt", "rb")
  ver_on_box = file.read
  log "openssl_version requested : #{new_resource.openssl_version}"
  log "openssl_version on box : #{ver_on_box}"

  if new_resource.openssl_version != ver_on_box.gsub("\n",'')
    log "Begin Update to #{openssl}"

    log "Removing the openssl directories"
    directory "#{new_resource.base_dir}/openssl" do
      recursive true
      action :delete
    end
  else
    log "No change in openssl_version, nothing to do.."
  end

end

def remove_httpd_modjk(httpd, modjk)

  httpd_file = ::File.open("#{new_resource.base_dir}/apache/httpd/httpd-version.txt", "rb")
  httpd_ver_on_box = httpd_file.read
  modjk_file = ::File.open("#{new_resource.base_dir}/apache/httpd/modjk-version.txt", "rb")
  modjk_ver_on_box = modjk_file.read
  log "httpd_version requested : #{new_resource.httpd_version}"
  log "httpd_version on box : #{httpd_ver_on_box}"
  log "modjk_version requested : #{new_resource.modjk_version}"
  log "modjk_version on box : #{modjk_ver_on_box}"

  if new_resource.httpd_version != httpd_ver_on_box.gsub("\n",'') || new_resource.modjk_version != modjk_ver_on_box.gsub("\n",'')
    log "Begin Update to #{httpd} and #{modjk}"

    log "Removing the httpd directories"
    directory "#{new_resource.base_dir}/apache" do
      recursive true
      action :delete
    end
  else
    log "No change in httpd_version or modjk_version, nothing to do.."
  end

end

def install_apr(apr)

  remote_file "#{new_resource.tmp_dir}/#{apr}.tar.gz" do
    source new_resource.apr_src
  not_if {::File.directory?("#{new_resource.base_dir}/apr/bin")}
  end

  Chef::Log.info "Extracting the installables for APR"
  apache_cookbook_extract "#{new_resource.tmp_dir}/#{apr}.tar.gz" do
    target_dir "#{new_resource.tmp_dir}/apr"
    user "root"
    group "root"
    not_if {::File.directory?("#{new_resource.base_dir}/apr/bin")}
  end

  Chef::Log.info "Install APR (Apache Portable Runtime)"
  bash "install-#{apr}" do
    cwd "#{new_resource.tmp_dir}/apr/#{apr}"
    user "root"
    code <<-EOF
    ./configure --prefix=#{new_resource.base_dir}/apr
    make && make install
    echo "#{new_resource.apr_version}" >> #{new_resource.base_dir}/apr/apr-version.txt
    EOF
    not_if {::File.directory?("#{new_resource.base_dir}/apr/bin")}
  end

end

def install_apr_util(apr_util)

  remote_file "#{new_resource.tmp_dir}/#{apr_util}.tar.gz" do
    source new_resource.apr_util_src
  not_if {::File.directory?("#{new_resource.base_dir}/apr-util/bin")}
  end

  Chef::Log.info "Extracting the installables for  APR-utils"
  apache_cookbook_extract "#{new_resource.tmp_dir}/#{apr_util}.tar.gz" do
    target_dir "#{new_resource.tmp_dir}/apr-util"
    user "root"
    group "root"
    not_if {::File.directory?("#{new_resource.base_dir}/apr-util/bin")}
  end

  Chef::Log.info "Install APR Util (Apache Portable Runtime Utility)"
  bash "install-#{apr_util}" do
    cwd "#{new_resource.tmp_dir}/apr-util/#{apr_util}"
    user "root"
    code <<-EOF
    ./configure --prefix=#{new_resource.base_dir}/apr-util --with-apr=#{new_resource.base_dir}/apr
    make && make install
    echo "#{new_resource.apr_util_version}" >> #{new_resource.base_dir}/apr-util/apr_util-version.txt
    EOF
    not_if {::File.directory?("#{new_resource.base_dir}/apr-util/bin")}
  end

end



def install_pcre(pcre)

  remote_file "#{new_resource.tmp_dir}/#{pcre}.tar.gz" do
    source new_resource.pcre_src
  not_if {::File.directory?("#{new_resource.base_dir}/pcre/bin")}
  end

  Chef::Log.info "Extracting the installables for PCRE"
  apache_cookbook_extract "#{new_resource.tmp_dir}/#{pcre}.tar.gz" do
    target_dir "#{new_resource.tmp_dir}/pcre"
    user "root"
    group "root"
    not_if {::File.directory?("#{new_resource.base_dir}/pcre/bin")}
  end

  Chef::Log.info "Install PCRE (Perl-Compatible Regular Expressions Library)"
  bash "install-#{pcre}" do
    cwd "#{new_resource.tmp_dir}/pcre/#{pcre}"
    user "root"
    code <<-EOF
    ./configure --prefix=#{new_resource.base_dir}/pcre
    make && make install
    echo "#{new_resource.pcre_version}" >> #{new_resource.base_dir}/pcre/pcre-version.txt
    EOF
    not_if {::File.directory?("#{new_resource.base_dir}/pcre/bin")}
  end

end



def install_openssl(openssl)

  remote_file "#{new_resource.tmp_dir}/#{openssl}.tar.gz" do
    source new_resource.openssl_src
  not_if {::File.directory?("#{new_resource.base_dir}/openssl/bin")}
  end

  Chef::Log.info "Extracting the installables for Openssl"
  apache_cookbook_extract "#{new_resource.tmp_dir}/#{openssl}.tar.gz" do
    target_dir "#{new_resource.tmp_dir}/openssl"
    user "root"
    group "root"
    not_if {::File.directory?("#{new_resource.base_dir}/openssl/bin")}
  end

  Chef::Log.info "Install OpenSSL library"
  bash "install-#{openssl}" do
    cwd "#{new_resource.tmp_dir}/openssl/#{openssl}"
    user "root"
    code <<-EOF
    ./config --prefix=#{new_resource.base_dir}/openssl shared
    make && make install
    echo "#{new_resource.openssl_version}" >> #{new_resource.base_dir}/openssl/openssl-version.txt
    EOF
    not_if {::File.directory?("#{new_resource.base_dir}/openssl/bin")}
  end

end



def install_httpd(httpd)

  remote_file "#{new_resource.tmp_dir}/#{httpd}.tar.gz" do
    source new_resource.httpd_src
  not_if {::File.directory?("#{new_resource.base_dir}/apache/httpd/bin")}
  end

  Chef::Log.info "Extracting the installables for Httpd"
  apache_cookbook_extract "#{new_resource.tmp_dir}/#{httpd}.tar.gz" do
    target_dir "#{new_resource.tmp_dir}/apache"
    user "root"
    group "root"
    not_if {::File.directory?("#{new_resource.base_dir}/apache/httpd/bin")}
  end

  Chef::Log.info "Install Apache HTTP Server by enabling SSL"
  bash "install-apache-#{httpd}" do
    cwd "#{new_resource.tmp_dir}/apache/#{httpd}"
    user "root"
    code <<-EOF
    ./configure --prefix=#{new_resource.base_dir}/apache/httpd/ --with-apr=#{new_resource.base_dir}/apr --with-apr-util=#{new_resource.base_dir}/apr-util/ --with-pcre=#{new_resource.base_dir}/pcre/ --enable-ssl --enable-so --with-ssl=#{new_resource.base_dir}/openssl/ --enable-module=ssl -with-mpm=#{new_resource.mpm} --enable-deflate
    make && make install
    echo "#{new_resource.httpd_version}" >> #{new_resource.base_dir}/apache/httpd/httpd-version.txt
    EOF
    not_if {::File.directory?("#{new_resource.base_dir}/apache/httpd/bin")}
  end

end



def install_modjk(modjk)

  remote_file "#{new_resource.tmp_dir}/#{modjk}.tar.gz" do
    source new_resource.modjk_src
  not_if {::File.exists?("#{new_resource.base_dir}/apache/httpd/modules/mod_jk.so")}
  end

  Chef::Log.info "Extracting the installables for Mod JK Connector"
  apache_cookbook_extract "#{new_resource.tmp_dir}/#{modjk}.tar.gz" do
    target_dir "#{new_resource.tmp_dir}/apache"
    user "root"
    group "root"
    not_if {::File.exists?("#{new_resource.base_dir}/apache/httpd/modules/mod_jk.so")}
  end

  Chef::Log.info "Install Mod JK"
  bash "install-#{modjk}" do
    cwd "#{new_resource.tmp_dir}/apache/#{modjk}/native"
    user "root"
    code <<-EOF
    ./configure --with-apxs=#{new_resource.base_dir}/apache/httpd/bin/apxs
    make && make install
    echo "#{new_resource.modjk_version}" >> #{new_resource.base_dir}/apache/httpd/modjk-version.txt
    EOF
    not_if {::File.exists?("#{new_resource.base_dir}/apache/httpd/modules/mod_jk.so")}
  end

end



def pre_install

  Chef::Log.info "Install required packages gcc gcc-c++ autoconf automake zlib-devel"
  %w(gcc gcc-c++ autoconf automake zlib-devel).each do |pkg|
    yum_package pkg do
      action :install
    end
  end

  Chef::Log.info "Create folder structures for Apache, Apr, Apr-Util, Openssl, Prce"
  directories = [
    "#{new_resource.base_dir}/apache",
    "#{new_resource.base_dir}/apr",
    "#{new_resource.base_dir}/apr-util",
    "#{new_resource.base_dir}/pcre",
    "#{new_resource.base_dir}/openssl",
    "#{new_resource.base_dir}/apache/httpd",
    "#{new_resource.base_dir}/apache/httpd/certificates",
    "#{new_resource.tmp_dir}/apache",
    "#{new_resource.tmp_dir}/apr",
    "#{new_resource.tmp_dir}/apr-util",
    "#{new_resource.tmp_dir}/pcre",
    "#{new_resource.tmp_dir}/openssl",
    "#{new_resource.logs}/apache/httpd"
  ]

  directories.each do |path|
    directory path do
      recursive true
      action :create
      not_if {::File.directory?(path)}
    end
  end

  Chef::Log.info "Creating the Apache group"
  group new_resource.group do
    gid new_resource.gid
    system true
    action :create
  end

  Chef::Log.info "Creating the Apache user"
  user new_resource.user do
    comment "User for apache"
    uid new_resource.uid
    gid new_resource.group
    home new_resource.usr_home
    shell new_resource.usr_shell
    system true
    action :create
  end

end



def post_install(apr, apr_util, pcre, openssl, httpd, modjk)

  Chef::Log.info "Install a default ping page"
  template "#{new_resource.base_dir}/apache/httpd/htdocs/ping.html" do
    source "ping.erb"
    cookbook "apache-cookbook"
    owner new_resource.user
    group new_resource.group
    mode 00740
    action :create
  end

  Chef::Log.info "fix permission for the directories"
  apache_cookbook_fixpermission "#{new_resource.base_dir}/apache #{new_resource.base_dir}/apache/httpd/logs" do
    user new_resource.user
    group new_resource.group
    mode "740"
    recursive true
  end

  # Fix permission for common libraries to root and accesible to both apahce and tomcat
  apache_cookbook_fixpermission "#{new_resource.base_dir}/pcre #{new_resource.base_dir}/apr #{new_resource.base_dir}/apr-util #{new_resource.base_dir}/openssl" do
    user "root"
    group "root"
    mode "755"
    recursive true
  end

  apache_cookbook_fixpermission "#{new_resource.base_dir}/apache/httpd/bin #{node['apache']['logs']}/apache" do
    user new_resource.user
    group new_resource.group
    mode "755"
    recursive true
  end
 # Remote Files CleanUp.

  Chef::Log.info "Remove the temp directories"
  directories = [
    "#{new_resource.tmp_dir}/apr",
    "#{new_resource.tmp_dir}/apr-util",
    "#{new_resource.tmp_dir}/pcre",
    "#{new_resource.tmp_dir}/openssl",
    "#{new_resource.tmp_dir}/apache"
  ]

  directories.each do |path|
    directory path do
      action :delete
      recursive true
    end
  end

  Chef::Log.info "Remove the downloaded files from artifactory"
  files = [
    "#{new_resource.tmp_dir}/#{apr}.tar.gz",
    "#{new_resource.tmp_dir}/#{apr_util}.tar.gz",
    "#{new_resource.tmp_dir}/#{pcre}.tar.gz",
    "#{new_resource.tmp_dir}/#{openssl}.tar.gz",
    "#{new_resource.tmp_dir}/#{httpd}.tar.gz",
    "#{new_resource.tmp_dir}/#{modjk}.tar.gz"
  ]

  files.each do |path|
    file path do
      action :delete
    end
  end

end
