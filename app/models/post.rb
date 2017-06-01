class Post < ApplicationRecord
	has_many :comments, dependent: :destroy
	has_many :participations
	has_many :users, through: :participations
	validates :title, :start_time, :end_time, presence: true, length: {minimum: 5}
	#acts_as_attendable :post_members, by: :users

	def participating?(user)
		Participation.where(user: user, post: self).exists?
	end
end
