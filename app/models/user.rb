class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #モデル間のアソシエーション　Userから見てpost_imagesはN個⇒has_many 相手方がN個なので複数形で記述
  has_many:post_images,dependent: :destroy
end
