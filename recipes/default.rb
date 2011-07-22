#
# Cookbook Name:: logstash
# Recipe:: default
#
# Copyright 2011, Heavy Water Software Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "grok"
include_recipe "git"
include_recipe "jruby"

git "/usr/src/logstash" do
  repository "https://github.com/logstash/logstash.git"
  reference "master"
  action :checkout
end

%w( jruby-elasticsearch
    bunny
    filewatch
    jls-grok
    json
    stomp
    stompserver
    uuidtools
    async_sinatra
    haml
    sass ).each do |g|
  gem_package g do
    gem_binary "/usr/bin/jgem"
  end
end
