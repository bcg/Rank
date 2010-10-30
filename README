
h1. Getting Started

*Create an account*

rake db:migrate

rails c

account = Account.new
account.name = "Account Name" # really not that important at this time
account.cname = "dev.local" # the multitenant account lookup is pretty 
account.save

site_configuration = SiteConfiguration.new
site_configuration.account = account
site_configuration.display_name = "My News Network" # shows up in the site header
site_configuration.short_name = "MNN" # used in situations where a short site name is needed, like the bookmarklet
site_configuration.private_site = true # require login to see anything on the site
site_configuration.save

