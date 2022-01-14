class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #モデル間のアソシエーション　Userから見てpost_imagesはN個⇒has_many 相手方がN個なので複数形で記述
  has_many:post_images,dependent: :destroy

  #AvtiveStrageで画像を使うための宣言(?) profile_imageカラムを追加
  has_one_attached:profile_image


  def get_profile_image #プロフィール画像取得メソッド

    #対象レコードのprofile_imageカラムが空ならば(if文のelseのみ版みたいな感じ)
    unless profile_image attached?
      #ActiveStrageに、画像が存在しないとき用のno_image.jpgをassetフォルダからrails側へ登録
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image.attach(io:File.open(file_path),filename:'default-image.jpg',content_type:'image/jpeg')
    end
    #sizeは引数！ get_profile_imageメソッドを呼び出す際に引数としてsizeを任意指定
    profile_image.variant(resize:size).processed
  end


end
