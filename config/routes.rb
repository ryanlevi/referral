Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '/api' do
    resource :appointments, only: [:index, :show, :create, :destroy]
  end
end
