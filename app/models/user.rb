class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true
  # validates:データベースへ保存する前にデータが正しいかチェックするよ！
  # presence:空の値になってませんか？
  # uniqueness:同じ値が入ってませんか？

  has_many :group_users
  has_many :groups, through: :group_users
end
