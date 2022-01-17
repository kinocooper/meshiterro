Rails.application.routes.draw do

  #devise_for :users は、devise を使用する際に URL として users を含むことを示しています。
  #自分で作ったusersコントローラのルート記述より上に書かないとログインできなくなる不具合あり！
  devise_for :users

  #usersコントローラのアクションまとめ記述
  resources:users,only:[:show,:edit,:update]

  #post_imagesコントローラのアクションまとめ記述
  resources:post_images,only:[:new,:index,:show,:create,:destroy] do
    #post_commentsコントローラのルーティング　ネストしてる。正直よくわからん・・・
    resources:post_comments,only:[:create,:destroy]
    #favoritesコントローラのルーティング ※resourcesでないことに注目
    resource:favorites,only:[:create,:destroy]
  
    
  end


  root to: 'homes#top'

  get 'homes/about' => 'homes#about',as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
