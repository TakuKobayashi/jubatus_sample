# coding: utf-8
class TwitterController < BaseController
  before_filter :load_sns_connection_info
  before_filter :twitter_client

  def index
  	@sentences = @user.sentences
  end

  def create
  	s = @user.sentences.new(params[:sentence])
  	s.type = "Tweet"
  	s.save!
  	redirect_to twitter_url
  end

  private
  def load_sns_connection_info
  	provider = controller_name.singularize
    @sns = @user.sns.where(info_type: (provider + "_info").classify).first
    if @sns.blank?
      session[:user_id] = @user.id
      redirect_to "/auth/" + provider and return
    end
  end

  def twitter_client
    @twitter_client = Twitter::Client.new(
      consumer_key: "FsRNQOHICbiLaelPwW9GQ6Okb", 
      consumer_secret: "Doz7ypYbxH87zIvlgxcwezDYgHkvynQ589xok9vHfVowUXzHqE",
      access_token:     @sns.token,
      access_token_secret: @sns.token_secret
    )
  end
end
