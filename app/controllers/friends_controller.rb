class FriendsController < ApplicationController
  def index
    @current_user = User.find(session[:user_id])
    @current_user_friends = @current_user.friendslist
    # raise @current_user.friendslist.inspect
    @friends = Friend.all
    respond_to do |format|
      format.html
      format.json { render json: @friend}
    end
  end

  def show
    @friend = Friend.find(params[:id])
  end


end
