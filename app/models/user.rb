class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname, format: { with: /\A[a-z\d]{4,16}+\z/i, message: "4~16文字以内の半角英数字ではありません"}
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}+\z/i, message: "8文字以上の半角英数字ではありません" }
  end

  has_many: notes
end
