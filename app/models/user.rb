class User < ApplicationRecord
  has_many :images, dependent: :destroy
  has_many :videos, dependent: :destroy
  has_many :audios, dependent: :destroy
  enum usertype: [:creator, :fan]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",
                                   foreign_key: "followed_id",
                                   dependent: :destroy
  has_many :subscriptions, through: :active_relationships, source: :followed
  has_many :subscribers, through: :passive_relationships, source: :follower

  # Follows a user.
  def subscribe(other_user)
    subscriptions << other_user
  end

  # Unfollows a user.
  def unsubscribe(other_user)
    subscriptions.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def subscriptions?(other_user)
    subscriptions.include?(other_user)
  end
end
