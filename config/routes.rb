Rails.application.routes.draw do
  scope :abare, module: :kakei do

    get '/', action: :redirect, controller: :kakeis

    resources :kakeis, only: [:index, :create, :edit, :update, :destroy] do
      collection do
        get 'summary'
        get ':year/:month', action: :monthly, constraints: {year: /[0-9]{4}/, month: /[0-9]{1,2}/}
        get ':year/:month/:day', action: :monthly, constraints: {year: /[0-9]{4}/, month: /[0-9]{1,2}/, day: /[0-9]{1,2}/}
        get 'yearly'
      end
    end
  end

  # 404例外用
  get  '*not_found' => 'application#routing_error'
  post '*not_found' => 'application#routing_error'

  root 'kakei/kakeis#redirect'
end
