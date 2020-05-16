class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books, dependant: :destroy
  validetes :name,presence: true,length: {minimum: 2 ,maximum: 20}
  validetes :email,presence: true
end
