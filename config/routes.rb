Rails.application.routes.draw do

  root :to => "home#index"

  resources :chairs
  resources :dispositivos
  resources :sensor_data

namespace :api do  
  resources :chairs, :dispositivos, :sensor_data
end  

end
