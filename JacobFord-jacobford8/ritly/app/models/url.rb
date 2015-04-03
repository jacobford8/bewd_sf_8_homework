class Url < ActiveRecord::Base

	validates :link, presence: true
	
	before_create do 
		self.hash_code = SecureRandom.urlsafe_base64(8)
	end	
	
end
