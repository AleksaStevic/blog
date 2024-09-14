Rails.application.routes.draw do
  root "pages#home"

  resources :blog_post, path: 'blog'
end
