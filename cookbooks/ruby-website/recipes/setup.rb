#
# Cookbook Name:: ruby-website
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

node['rbenv']['rubies'] = node['ruby_website']['rubies']

include_recipe "apt"
package "build-essential"
include_recipe "ruby_build"
include_recipe "rbenv::system"
include_recipe "rbenv::vagrant"

# Prerequisite for nginx's ohai_plugin.
include_recipe "ohai"

rbenv_global "1.9.3-p286"
rbenv_gem "bundler"
