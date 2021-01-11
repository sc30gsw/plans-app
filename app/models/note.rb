class Note < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :text
    validates :plan
  end

  has_one_attached :image
  has_many :comments
  belongs_to :user
end
