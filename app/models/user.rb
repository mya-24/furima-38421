class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,             presence: true
  validates :firstname_kanji,      presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'must enter double-type characters'}
  validates :lastname_kanji,       presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'must enter double-type characters'}
  validates :firstname_katakana,   presence: true, format: { with: /[ァ-ヶー－]/, message: 'must enter double-type katakana'}
  validates :lastname_katakana,    presence: true, format: { with: /[ァ-ヶー－]/, message: 'must enter double-type katakana'}
  validates :birthday,             presence: true

  validates :password,            format: { with: /(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}/i, message: 'must contain both alphabets and numbers'}
  has_many :purchase_logs

end
