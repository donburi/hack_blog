class Post < ActiveRecord::Base

	def lead
		content.first(100) + "..."
	end

	def ==(b)
		title == b.title 
	end

	def by?(author)
		self.author == author
	end

	def same_category?(post)
		self.category == post.category
	end

end
