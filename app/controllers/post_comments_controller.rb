class PostCommentsController < ApplicationController

 def create
  #とんできたURLから投稿IDを取得、モデルからその投稿レコードを検索しローカル変数へ代入
  post_image = PostImage.find(params[:post_image_id])
  comment = current_user.post_comments.new(post_comment_params) #←かなり理解しづらい…
  # ↑の一文は↓の2行の省略形
  # ↓PostCommentモデルに空のインスタンス生成、そこにストロングパラメータで受け取った値を入れてcommentに代入
  # comment = PostComment.new(post_comment_params)
  # ↓入力フォームにはuser.idを入力する場所なんかないので、ログインユーザのidを勝手に取得してuser.idカラムに保存
  # comment.user_id = current_user.id

  # ↓同じような話で、現在のpost_image.idを勝手にcommentの方のpost_image_idカラムに保存
  comment.post_image_id = post_image.id

  comment.save
  redirect_to post_image_path(post_image)
 end

 def destroy
  PostComment.find(params[:id]).destroy
  redirect_to post_image_path(params[:post_image_id])
 end


 private

 def post_comment_params
  params.require(:post_comment).permit(:comment)
 end

end