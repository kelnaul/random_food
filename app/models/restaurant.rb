class Restaurant < ActiveRecord::Base

	geocoded_by  :address  # can also be an IP address
	after_validation :geocode     # auto-fetch coordinates
	
	
end
