class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true
  # validates:データベースへ保存する前にデータが正しいかチェックするよ！
  # presence:空の値になってませんか？ (not_null)
  # uniqueness:同じ値が入ってませんか？
end
