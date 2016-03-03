# Apache Base Directories
default['apache']['base_dir'] = '/apps/install'
default['apache']['tmp_dir'] = '/apps/tmp'
default['apache']['logs'] = '/apps/logs'

# user and group details.
default['apache']['user'] = 'apache'
default['apache']['uid'] = '94'
default['apache']['group'] = 'apache'
default['apache']['gid'] = '94'
default['apache']['usr_home'] = '/home/apache'
default['apache']['usr_shell'] = '/bin/sh'

# Versions to be installed, should be overridden if some other version to be installed.
default['apache']['apr']['version'] = '1.4.8'
default['apache']['apr_util']['version'] = '1.5.2'
default['apache']['pcre']['version'] = '8.33'
default['apache']['openssl']['version'] = '1.0.1g'
default['apache']['httpd']['version'] = '2.4.6'
default['apache']['modjk']['version'] = '1.2.37'
# Apache Server MPM - Can be 'event', 'worker', or 'prefork'. See http://httpd.apache.org/docs/2.4/mpm.html
default['apache']['mpm'] = 'event'

# Artifactory src url.
# apr URL's
default['apache']['apr_src'] =
  "https://binrepo.target.com/artifactory/tcom-acdc/packages/others/apache/apr/#{node['apache']['apr']['version']}.tar/apr-#{node['apache']['apr']['version']}.tar.gz"
# apr_util URL's
default['apache']['apr_util_src'] =
  "https://binrepo.target.com/artifactory/tcom-acdc/packages/others/apache/apr-util/#{node['apache']['apr_util']['version']}.tar/apr-util-#{node['apache']['apr_util']['version']}.tar.gz"
# pcre URL's
default['apache']['pcre_src'] =
  "https://binrepo.target.com/artifactory/tcom-acdc/packages/others/apache/pcre/#{node['apache']['pcre']['version']}.tar/pcre-#{node['apache']['pcre']['version']}.tar.gz"
# openssl URL's
default['apache']['openssl_src'] =
  "https://binrepo.target.com/artifactory/tcom-acdc/packages/others/apache/openssl/#{node['apache']['openssl']['version']}.tar/openssl-#{node['apache']['openssl']['version']}.tar.gz"
# httpd URL's
default['apache']['httpd_src'] =
  "https://binrepo.target.com/artifactory/tcom-acdc/packages/others/apache/httpd/#{node['apache']['httpd']['version']}.tar/httpd-#{node['apache']['httpd']['version']}.tar.gz"
# modjk URL's
default['apache']['modjk_src'] =
  "https://binrepo.target.com/artifactory/tcom-acdc/packages/others/apache/tomcat-connectors/#{node['apache']['modjk']['version']}/tomcat-connectors-#{node['apache']['modjk']['version']}-src.tar.gz"

default['apache']['instance_name'] = ''
default['apache']['context_path_name'] = []
default['apache']['workers'] = {}

default['apache']['proxy'] = true
