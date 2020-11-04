class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  texts = /\A[ぁ-んァ-ン一-龥]+\z/
  text_kana = /\A[ァ-ン]+\z/
  
  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: texts }
    validates :family_name, format: { with: texts }
    validates :first_name_kana, format: { with: text_kana }
    validates :family_name_kana, format: { with: text_kana }
    validates :birth_day
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }

end
