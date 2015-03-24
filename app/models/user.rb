class User < ActiveRecord::Base

has_many :posts
has_one :profile

validates :email, presence: true
validates :email, uniqueness: true
validates :name, presence: true
validates :date_of_birth, presence: true
#validate :is_over_18
#validates :gender, inclusion: { in: %w(m f o),  message: "%{value} is not a valid gender" }

	# def is_over_18
	#  	where("date(date_of_birth) <= ?", 18.years.ago.to_date)
	#end


end
