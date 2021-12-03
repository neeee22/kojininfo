Rails.application.routes.draw do
  root to: 'posts#index'
  resources :posts, only: [:index, :create, :destroy, :edit, :update] do
    collection do
      get 'search'
    end
  end
end
