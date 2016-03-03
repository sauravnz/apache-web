include_recipe 'apache-cookbook'

apache_cookbook_base 'Apache Installation' do
  apr_version '1.5.1'
  apr_util_version '1.5.2'
  pcre_version '8.33'
  openssl_version '1.0.1i'
  httpd_version '2.4.6'
  modjk_version '1.2.40'
  apr_src "https://binrepo.target.com/artifactory/simple/tcom-acdc/packages/others/apache/apr/1.5.1.tar/apr-1.5.1.tar.gz"
  apr_util_src "https://binrepo.target.com/artifactory/simple/tcom-acdc/packages/others/apache/apr-util/1.5.2.tar/apr-util-1.5.2.tar.gz"
  pcre_src "https://binrepo.target.com/artifactory/simple/tcom-acdc/packages/others/apache/pcre/8.33.tar/pcre-8.33.tar.gz"
  openssl_src "https://binrepo.target.com/artifactory/simple/tcom-acdc/packages/others/apache/openssl/1.0.1i.tar/openssl-1.0.1i.tar.gz"
  httpd_src "https://binrepo.target.com/artifactory/simple/tcom-acdc/packages/others/apache/httpd/2.4.6.tar/httpd-2.4.6.tar.gz"
  modjk_src "https://binrepo.target.com/artifactory/simple/tcom-acdc/packages/others/apache/tomcat-connectors/1.2.40/tomcat-connectors-1.2.40-src.tar.gz"
  action :install
end
