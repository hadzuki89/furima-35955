class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :name, :password, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_day, presence: true
  has_many :items
  has_many :purchase_records
  
end
