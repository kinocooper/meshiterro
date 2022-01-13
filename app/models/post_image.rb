class PostImage < ApplicationRecord

  #ActiveStrageで画像を扱えるようにするための記述
  has_one_attached:image
  
  #アソシエーション　相手方が1なので、
  belongs_to:user
  
end
