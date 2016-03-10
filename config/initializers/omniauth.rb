

if Rails.env == "production"
  # no production app yet
	Rails.application.config.middleware.use OmniAuth::Builder do
    	#provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
		provider_ignores_state: true,
    	provider :facebook, '1040359132702969', 'c6b3675a3c5f8e72123eff48250cc341'  # Find these values on the Facebook App page
	end

else
    Rails.application.config.middleware.use OmniAuth::Builder do
      #provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'
      provider :facebook, '1041021142636768', 'b0d18a859f6418e5c60c6ae51c1cfebd'  # Find these values on the Facebook App page
  end
end
