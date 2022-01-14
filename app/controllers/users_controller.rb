class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])

    #@post_images というインスタンス変数に、↑で取得したユーザーに紐づく投稿をすべて代入
    #@user.post_images ⇒ @userに紐づくpost_imagesモデル（テーブル？）のすべてを代入
    #アソシエーションが通ってるモデル同士で使える記述。
    @post_images = @user.post_images
  end

  def edit
  end
end
