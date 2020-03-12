class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
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


  private
    def tweet_params
      params.require(:tweet).permit(:content)
    end

end
