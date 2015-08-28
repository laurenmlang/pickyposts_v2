Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,'498048030372740', '5804cf26a37845cb79181565d82d461e',
  {:scope => 'email,user_friends',
  :client_options => {:ssl => {:verify => false}}}

end
