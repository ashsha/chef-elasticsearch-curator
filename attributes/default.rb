default['elasticsearch-curator']['version'] = nil
default['elasticsearch-curator']['install_method'] = 'package'
case node['platform_family']
when 'debian'
  default['elasticsearch-curator']['repository_url'] = 'http://packages.elastic.co/curator/5/debian'
when 'rhel'
  default['elasticsearch-curator']['repository_url'] = 'http://packages.elastic.co/curator/5/centos/7'
end
default['elasticsearch-curator']['repository_key'] = 'https://packages.elastic.co/GPG-KEY-elasticsearch'
default['elasticsearch-curator']['bin_path'] = '/usr/bin'
default['elasticsearch-curator']['config'] = {
  'client' => {
    'hosts' => ['127.0.0.1'],
    'port' => 9200,
    'use_ssl' => false,
    'ssl_no_validate' => false,
    'timeout' => 30,
    'master_only' => false
  },
  'logging' => {
    'loglevel' => 'INFO',
    'logformat' => 'default'
  }
}
default['elasticsearch-curator']['username'] = 'curator'
default['elasticsearch-curator']['config_file_path'] = "/home/#{node['elasticsearch-curator']['username']}/.curator"
default['elasticsearch-curator']['action_file_path'] = "/home/#{node['elasticsearch-curator']['username']}/.curator"
default['elasticsearch-curator']['cron_minute'] = '17'
default['elasticsearch-curator']['cron_hour'] = '9'
default['elasticsearch-curator']['day_of_the_month'] = '2'
default['elasticsearch-curator']['month'] = '7'
default['elasticsearch-curator']['day_of_the_week'] = '1'

default['elasticsearch-curator']['action_config'] = {
  'actions' => {
    1 => {
      'action' => 'snapshot',
      'description' => 'Curator snapshot action',
      'options' => {
        'repository' => 'backup',
        # Leaving name blank will result in the default 'curator-%Y%m%d%H%M%S'
        'name' => '',
        'ignore_unavailable' => false,
        'include_global_state' => true,
        'partial' => false,
        'wait_for_completion' => true,
        'skip_repo_fs_check' => false,
        'disable_action' => false
        },
      'filters' => [
        {
          'filtertype' => 'pattern',
          'kind' => 'prefix',
          'value' => 'logstash-'}
        ]
      }
    }
  }
  