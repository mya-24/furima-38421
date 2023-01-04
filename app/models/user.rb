class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,             presence: true
  validates :firstname_kanji,      presence: true, format: { with: /[ぁ-んァ-ン一-龥]/, message: 'must enter double-type characters'}
  validates :lastname_kanji,       presence: true, format: { with: /[ぁ-んァ-ン一-龥]/, message: 'must enter double-type characters'}
  validates :firstname_katakana,   presence: true, format: { with: /[ァ-ヶー－]/, message: 'must enter double-type katakana'}
  validates :lastname_katakana,    presence: true, format: { with: /[ァ-ヶー－]/, message: 'must enter double-type katakana'}
  validates :birthday,             presence: true

  validates :password,            format: { with: /(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}/i, message: 'must contain both alphabets and numbers'}
  has_many :purchase_logs

end
