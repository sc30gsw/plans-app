class Note < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :title
    validates :text
    validates :plan
  end
end
