maintainer       "YOUR_COMPANY_NAME"
maintainer_email "YOUR_EMAIL"
license          "All rights reserved"
description      "Installs/Configures php-website"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

depends "apache2"
depends "mysql"
depends "php"

attribute "php_website",
  :display_name => "PHP website hash",
  :description => "Hash of website attributes",
  :type => "hash"

attribute "php_website/app_name",
  :display_name => "PHP Application Name",
  :description => "The name of the site, used internally (no spaces!)",
  :default => "php_web_application"

attribute "php_website/db_name",
  :display_name => "Database Name",
  :description => "The name of the MySQL database.",
  :default => "php_web_application"
