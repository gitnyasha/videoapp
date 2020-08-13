class User < ApplicationRecord
  has_many :images, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :audios, dependent: :destroy
  enum usertype: [:creator, :fan]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
