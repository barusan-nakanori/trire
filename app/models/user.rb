class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_books, through: :favorites, source: :book
  has_many :comments
  has_many :follower, class_name:"Relationship",
            foreign_key: "follower_id",
            dependent: :destroy
  has_many :followed, class_name:"Relationship",
            foreign_key: "followed_id",
            dependent: :destroy
  attachment :profile_image
  validates :name,presence: true,length: {minimum: 2 ,maximum: 20}
  validates :email,presence: true
  validates :introduction,length: {maximum: 50}

  def already_favorited?(book)
    self.favorites.exists?(book_id: book.id)
  end
end
