class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_many :reviews
         has_many :likes
         
  def already_liked?(review)
    self.likes.exists?(review_id: review.id)
  end
end
