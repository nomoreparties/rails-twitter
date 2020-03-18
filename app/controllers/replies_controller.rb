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
    @reply = @repliable.replies.create(reply_params.merge(user_id: current_user.id))

    if @reply.save
      redirect_to root_path
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
    def reply_params
      params.require(:reply).permit(:content, :repliable_id, :repliable_type)
    end


end
