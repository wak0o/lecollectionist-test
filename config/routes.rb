Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :shops do
    resources :opening_times, only: [:new, :create, :edit, :update, :destroy]
  end

  root 'shops#index'
end
