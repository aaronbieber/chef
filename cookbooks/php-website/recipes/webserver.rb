#
# Cookbook Name:: php-website
# Recipe:: webserver
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

app_config = node['php_website']
app_name = app_config['app_name']

include_recipe "apache2"
include_recipe "apache2::mod_php5"

# Set up the Apache virtual host
web_app app_name do
  docroot "/var/www/#{app_name}/public"
  log_dir "/var/www/#{app_name}/logs"
  template "apache-site.conf.erb"
end

directory "/var/www/#{app_name}" do
  action :create
  owner "www-data"
  group "www-data"
  mode "0755"
  recursive true
end

directory "/var/www/#{app_name}/public" do
  action :create
  owner "www-data"
  group "www-data"
  mode "0755"
  recursive true
end

directory "/var/www/#{app_name}/logs" do
  action :create
  owner "www-data"
  group "www-data"
  mode "0755"
  recursive true
end

#
# Set up the local application config.
# This part is most likely to be different for different applications.
#

# directory "#{app_config['config_dir']}" do
#   owner "root"
#   group "root"
#   mode "0755"
#   action :create
#   recursive true
# end
#
# template "#{app_config['config_dir']}/local.config.php" do
#   source "local.config.php.erb"
#   mode 0440
#   owner "root"
#   group node['apache']['group']
#   variables(
#     'db_master' => {
#       'user' => app_config['db_user'],
#       'pass' => app_secrets[node.chef_environment]['db_pass'],
#       'dbname' => app_config['db_name'],
#       'host' => master_db_host,
#     }
#   )
# end
