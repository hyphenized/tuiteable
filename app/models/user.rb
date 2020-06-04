class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tuits, foreign_key: 'owner_id', dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :comments, dependent: :destroy
end
