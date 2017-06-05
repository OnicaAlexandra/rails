class Participation < ApplicationRecord
  belongs_to :post
  belongs_to :user
  attr_accessor :current_user
end
