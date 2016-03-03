if defined?(ChefSpec)

  def install_apache_cookbook_base(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:apache_cookbook_base, :install, resource_name)
  end

  def configure_apache_cookbook_httpd(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:apache_cookbook_httpd, :configure, resource_name)
  end

  def configure_apache_cookbook_tomcat_connectors(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:apache_cookbook_tomcat_connectors, :configure, resource_name)
  end

  def configure_apache_cookbook_key_store(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:apache_cookbook_key_store, :configure, resource_name)
  end

  def configure_apache_cookbook_init_service(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:apache_cookbook_init_service, :configure, resource_name)
  end

  def start_apache_cookbook_init_service(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:apache_cookbook_init_service, :start, resource_name)
  end

  def stop_apache_cookbook_init_service(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:apache_cookbook_init_service, :stop, resource_name)
  end

  def restart_apache_cookbook_init_service(resource_name)
    ChefSpec::Matchers::ResourceMatcher.new(:apache_cookbook_init_service, :restart, resource_name)
  end

end
