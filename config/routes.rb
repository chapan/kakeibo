Rails.application.routes.draw do
  scope :abare do
    scope module: :kakei do
      get '/', action: :redirect, controller: :kakeis

      resources :kakeis, only: [:index, :create, :destroy, :edit, :update] do
        collection do
          get 'summary'
          get ':year/:month', action: :monthly, constraints: {year: /[0-9]{4}/, month: /[0-9]{1,2}/}
          get ':year/:month/:day', action: :monthly, constraints: {year: /[0-9]{4}/, month: /[0-9]{1,2}/, day: /[0-9]{1,2}/}
          get 'yearly'
        end
      end

      resources :monthly_payments, only: [:index, :create, :destroy, :edit, :update]
    end

    scope module: :twitter do
      scope module: :tweets do
        post 'tweet'
        post 'update_profile'
      end
    end
  end

  # scope :abare, module: :twitter do
  #   resources :tweets, only: [:new, :create] do
  #     collection do
  #       get 'post'
  #     end
  #   end
  # end

  # 404例外用
  get  '*not_found' => 'application#routing_error'
  post '*not_found' => 'application#routing_error'

  root 'kakei/kakeis#redirect'
end
