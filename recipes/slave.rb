#
# Cookbook Name:: redis-cookbook
# Recipe:: default
#
# Copyright (C) 2014 Greg Palmier

# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#   http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

search(:node, 'tags:redis_master',
  :filter_result => { 'name' => [ 'name' ],
                      'ip' => [ 'ipaddress' ],
                      'kernel_version' => [ 'kernel', 'version' ]
                    }
      ).each do |result|
  node.set['redis']['redis_master']  = result['ip']
end


  #master = search('node', 'tags:redis_master')
  #node.set['redis']['redis_master'] = master.first['ipaddress']
%w(redis-server).each do |pkg|
  package pkg do
    action :upgrade
  end
end

service 'redis-server' do
  supports :status => 'true', :restart => 'true', :stop => 'true'
  action [:enable, :start]
end

template '/etc/redis/redis.conf' do
  source 'redis.slave.conf.erb'
  owner 'root'
  group 0
  mode 00644
  notifies :restart, 'service[redis-server]', :immediately
end

tag('redis_slave')
tag('redis')
