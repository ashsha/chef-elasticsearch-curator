#
# Cookbook Name:: elasticsearch-curator
# Recipe:: default
#
# Copyright (C) 2016
#
#
#

elasticsearch_curator_install 'curator' do
  install_method node['elasticsearch-curator']['install_method']
  action :install
end

elasticsearch_curator_config 'default' do
  config node['elasticsearch-curator']['config']
  action :configure
end

elasticsearch_curator_action 'snapsot_elk_2nd' do
  config                node['elasticsearch-curator']['action_config']
  minute                node['elasticsearch-curator']['cron_minute']
  hour                  node['elasticsearch-curator']['cron_hour']
  day                   node['elasticsearch-curator']['day_of_the_month']
  month                 node['elasticsearch-curator']['month']
  weekday               node['elasticsearch-curator']['day_of_the_week']
  action :create
end