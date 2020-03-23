class TweetsController < ApplicationController

  def index
    @tweets = Tweet.search(params[:search])
    @users = User.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
      @tweet = current_user.tweets.new(tweet_params)

      if @tweet.save
        redirect_to tweet_path(@tweet)
      else
        render :new
      end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def destroy
    @tweet = Tweet.find(params[:id])

    if @tweet.destroy
      redirect_to root_path
    end
  end

  def like
    @tweet = Tweet.find(params[:tweet_id])
    @tweet.increment! :like
    redirect_back(fallback_location: root_path)
  end

  def retweet
    @tweet = Tweet.find(params[:tweet_id])
    @tweet.increment! :retweet

    current_user.tweets.create(content: @tweet.content.dup, like: 0, retweet: 0)
    redirect_back(fallback_location: root_path)
  end


  private
    def tweet_params
      params.require(:tweet).permit(:content, :search, :upload, uploads: [])
    end

end
