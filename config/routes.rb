Rails.application.routes.draw do
  resources :orders do
    member do
      post :apply_discount_coupon
    end
  end
end
