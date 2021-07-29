Rails.application.routes.draw do
  resources :couriers   do
    resources :packages do
      member do
        patch :complete
      end
    end
  end
  root 'couriers#index'
end
