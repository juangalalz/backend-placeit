Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount RailsAdmin::Engine => '/admin'
  scope 'api' do
    resources :movies, only: [:index, :create]
    resources :reservations, only: [:index, :create, :show]
  end  

end
