class UserSession < Authlogic::Session::Base
  single_access_allowed_request_types [ :get, :post ]
  params_key :token
  
  # belongs_to :account
  # validates_presence_of :account
end
