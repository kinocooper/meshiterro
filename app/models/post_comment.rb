class PostComment < ApplicationRecord

  #アソシエーション
  #相手方が1なので単数形で
  belongs_to:user
  belongs_to:post_image
end
