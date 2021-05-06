class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders
  
  with_options presence: true do
  validates :nickname       
  validates :first_name,            format: { with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :first_name_kana,       format: { with:/\A([ァ-ン]|ー)+\z/ }
  validates :last_name,             format: { with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :last_name_kana,        format: { with:/\A([ァ-ン]|ー)+\z/ }
  validates :birthday    
  validates :email         
  validates :password,              format: { with:/\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/ }
  validates :password_confirmation, format: { with:/\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]+\z/ }
  end

end
