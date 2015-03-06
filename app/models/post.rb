class Post < ActiveRecord::Base

	def lead
		content.first(100) + "..."
	end
end
