class PostImage < ApplicationRecord

  #ActiveStrageで画像を扱う宣言(?)　imageカラムを追加
  has_one_attached:image

  #アソシエーション
  #相手方が1なので、単数形で記述
  belongs_to:user
  #相手方がN個なので、複数形で記述、投稿が消えたら結びつくコメントも全削除
  has_many:post_comments,dependent: :destroy

  #画像表示メソッド 対象のレコードのimageカラムにモノが入ってれば真  空なら偽で空画像表示
  # def get_image
  #   if image.attached?
  #     image
  #   else
  #     'no_image.jpg'
  #   end
  # end

  def get_image #画像取得メソッド

    #対象レコードのimageカラムが空ならば(if文のelseのみ版みたいな感じ)
    unless image.attached?
      #ActiveStrageに、画像が存在しないとき用のno_image.jpgをassetフォルダからrails側へ登録
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io:File.open(file_path),filename:'default-image.jpg',content_type:'image/jpeg')
    end
    #imageカラムに投稿画像またはno_image.jpgが入ったので、imageカラムの内容を返す
    image
  end

end
