if Rails.env == "production"
  # no production app yet
  Rails.application.config.middleware.use OmniAuth::Builder do
      #provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
      provider :facebook, '1040359132702969', '●●●●●●●●'  # Find these values on the Facebook App page
	end

else
    Rails.application.config.middleware.use OmniAuth::Builder do
      #provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
      provider :facebook, '1041021142636768', '●●●●●●●●'  # Find these values on the Facebook App page
  end
end
