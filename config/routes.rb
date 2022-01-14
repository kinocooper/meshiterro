Rails.application.routes.draw do

  #usersコントローラのアクションまとめ記述
  resources:users,only:[:show,:edit]

  #post_imagesコントローラのアクションまとめ記述
  resources:post_images,only:[:new,:index,:show,:create,:destroy]

  #devise_for :users は、devise を使用する際に URL として users を含むことを示しています。
  devise_for :users

  root to: 'homes#top'

  get 'homes/about' => 'homes#about',as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
