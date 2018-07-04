Rails.application.routes.draw do
  resources :magazines do
    resources :links do
      collection do
        patch :sort
      end
    end
  end

  root 'magazines#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
