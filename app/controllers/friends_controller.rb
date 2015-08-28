class FriendsController < ApplicationController
  def index
    @current_user = User.find(session[:user_id])
    @current_user.friendslist

    @friends = Friend.all
    respond_to do |format|
      format.html
      format.json { render json: @friend}
    end
  end

  def show
    @friend = Friend.find(params[:id])
  end

  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new
    @friend.uid = params[:uid]
    @friend.name = params[:name]

    if @friend.save
      redirect_to "/friends", :notice => "Friend created successfully."
    else
      render 'new'
    end
  end

  def edit
    @friend = Friend.find(params[:id])
  end

  def update
    @friend = Friend.find(params[:id])

    @friend.uid = params[:uid]
    @friend.name = params[:name]

    if @friend.save
      redirect_to "/friends", :notice => "Friend updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @friend = Friend.find(params[:id])

    @friend.destroy

    redirect_to "/friends", :notice => "Friend deleted."
  end
end
