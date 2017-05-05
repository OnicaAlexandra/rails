class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role 
  before_create :set_default_role
  enum role: {user: 0, banned: 1, admin: 2}
  private
  def set_default_role
  	self.role ||= Role.find_or_create_by_name('user')
  end	
end
