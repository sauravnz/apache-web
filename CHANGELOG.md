apache-cookbook CHANGELOG
=========================

This file is used to list changes made in each version of the apache-cookbook cookbook.

0.3.10
  [Saurav Sen]
  - httpd and proxy template updated with logrotation, index added

0.3.9
  [Saurav Sen]
  - Fixed user and group for httpd_proxy provider
  - added enable apache service

0.3.8
  [Saurav Sen]
  - Fixed apache instances restart with every chef run.
  - User groups fixed which were causing instance restart
  - Permission fixes for bin and Log Directories
  - Update service script to provide 755 to log files on every start/restart

0.3.4
- [Kannan] Added apache restart notifies for configuration file changes
- Added variable to override proxy template file in wrapper cookbook
- Added status check in service script
- Added default values to attributes in httpd resource

0.3.3
- [Rafael] CIS hardening for apache

0.3.2
- [Kannan] Added SSL variable in tomcat_connectors provider

0.3.1
- [Kannan] Refactored the cookbook to pass Source artifactory URLs through LWRP.

0.3.0
- [Kannan] Refactored the cookbook to write separate recipes for,
- Install Apache
- Proxypass
- Modjk Workers configuration

0.1.0
-----
- [your_name] - Initial release of apache-cookbook
