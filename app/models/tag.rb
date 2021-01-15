class Tag < ApplicationRecord
  has_many :notes, through: :note_tags
  has_many :note_tags

  validates :name, uniqueness: true
end
