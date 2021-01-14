class Note < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :text
    validates :plan
  end

  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :commented_users, through: :comments, source: :user
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
end
