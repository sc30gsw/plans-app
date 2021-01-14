class Note < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :text
    validates :plan
  end

  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :commented_notes, through: :comments, source: :user
  belongs_to :user
end
