class Comment < ActiveRecord::Base

	def self.today
		where('created_at > ?', Date.today.beginning_of_day)
	end

end
