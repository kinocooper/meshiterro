class FavoritesController < ApplicationController

  def create
    # URLから対象の投稿のレコードを検索、post_image変数へ代入
    post_image = PostImage.find(params[:post_image_id])
    # current_userに結びつく(user_idがcurrent_userのidとなる)favoritesを生成、post_image_idカラムは今のpost_iamgeのidカラムを指定)
    favorite = current_user.favorites.new(post_image_id:post_image.id)
    favorite.save
    redirect_to post_image_path(post_image)
  end

  def destroy
    post_image = PostImage.find(params[:post_image_id])
    # current_userに結びつく(user_idがcurrent_userのidと同じ)favoritesテーブルからpost_image_idが現在のpost_imageのidと同じものを探してdestroy
    favorite = current_user.favorites.find_by(post_image_id:post_image.id)
    favorite.destroy
    redirect_to post_image_path(post_image)
  end

end
