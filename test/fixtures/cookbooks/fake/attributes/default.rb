default['storage']['volumes'] = {
  'vol_apps_tomcat' => {
    'size' => '1G',
    'mount' => '/apps/tomcat',
    'group' => 'rootvg',
    'filesystem' => 'ext4'
  },
  'vol_apps_tmp' => {
    'size' => '1G',
    'mount' => '/apps/tmp',
    'group' => 'rootvg',
    'filesystem' => 'ext4'
  },
  'vol_apps_install' => {
    'size' => '1G',
    'mount' => '/apps/install',
    'group' => 'rootvg',
    'filesystem' => 'ext4'
  },
  'vol_apps_logs' => {
    'size' => '5G',
    'mount' => '/apps/logs',
    'group' => 'rootvg',
    'filesystem' => 'ext4'
  }
}
