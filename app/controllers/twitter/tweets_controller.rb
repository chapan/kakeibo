class Twitter::TweetsController < BaseController
  before_action :twitter_client, only: [:post]

  def post
    status = "テスト"
    @twitter.update(status)
    redirect_to :root
  end
end
