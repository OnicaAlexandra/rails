class Post < ApplicationRecord
	has_many :comments, dependent: :destroy
	has_many :events_participants
	has_many :participants, through: :events_participants
	validates :title, :start_time, :end_time, presence: true, length: {minimum: 5}
	#acts_as_attendable :post_members, by: :users
end
