Rails.application.routes.draw do
  namespace :bx_block_shoutout do
    resources :shoutouts
  end
end
