class RepliesController < ApplicationController
  def new
    @reply = Reply.new
  end

  def create
    if params[:reply_id]
      @repliable = Reply.find_by(id: params[:reply_id])
    end
    if params[:tweet_id]
      @repliable = Tweet.find_by(id: params[:tweet_id])
    end
    @reply = @repliable.replies.create(reply_params)
  end

  private
    def reply_params
      params.require(:reply).permit(:content, :repliable_id, :repliable_type)
    end


end
