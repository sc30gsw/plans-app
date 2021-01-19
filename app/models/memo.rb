class Memo < ApplicationRecord
  
  validates :content, presence: true
end
