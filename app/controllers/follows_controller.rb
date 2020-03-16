class FollowsController < ApplicationController
  def follow
    @user = current_user
    @following_user = User.find_by(id: params[:follow_id].to_i)
    @follow = @user.follows.create(following_id: @following_user.id)

    if @follow.save
      flash[:message] = "Follow Successful"
      redirect_to user_path(@following_user.id)
    else
      flash[:message] = "Follow Unsuccessful"
      redirect_to root_path
    end
  end

  def unfollow
    @user = current_user
    @following_user = User.find_by(id: params[:follow_id].to_i)

    @follow = @user.follows.find_by(following_id: @following_user)

    if @follow.destroy
      redirect_to user_path(@following_user.id)
    else
      redirect_to root_path
    end
  end
end
