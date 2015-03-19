class User < ActiveRecord::Base

validates :email, presence: true
validates :email, uniqueness: true
validates :date_of_birth, presence: true
validate :is_over_18

	def is_over_18
		if date_of_birth > 18.years.ago
			errors.add(:date_of_birth, "is less than 18 years ago")
		end
	end

end
