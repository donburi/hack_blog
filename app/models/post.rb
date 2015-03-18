class Post < ActiveRecord::Base

	validates :title, presence: true, length: { maximum: 140 }
	validates :author, presence: true
	validates :category, presence: true
	validates :content, presence: true

	# def lead
	# 	content.truncate(100, separator: ' ') 
	# end

	def ==(b)
		#self.title == b.title 
	end

	def by?(author)
		self.author == author
	end

	def same_category?(post)
		self.category == post.category
	end

	def self.by(author) # self. == class method (not instance method)
		where("author like ?", "%#{author}%")
	end

	def self.latest(n = 2)
		order('created_at DESC').limit(n)
	end

	def self.alphabetical
		order(:title) 
	end

	def self.entitled(title)
		where(title: title)
	end

end
