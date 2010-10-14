class Account < ActiveRecord::Base
  has_one :site_configuration
end
