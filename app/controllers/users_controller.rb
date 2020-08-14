class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy,
                                            :subscriptions, :subscribers]

  def dashboard
    @audios = current_user.audios.paginate(page: params[:page])
    @images = current_user.images.paginate(page: params[:page])
    @videos = current_user.videos.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @audios = @user.audios.paginate(page: params[:page])
    @images = @user.images.paginate(page: params[:page])
    @videos = @user.videos.paginate(page: params[:page])
  end

  def subscriptions
    @title = "Subscriptions"
    @user = User.find(params[:id])
    @users = @user.subscriptions.paginate(page: params[:page])
    render "show_subscribe"
  end

  def subscribers
    @title = "Subscribers"
    @user = User.find(params[:id])
    @users = @user.subscribers.paginate(page: params[:page])
    render "show_subscribe"
  end
end
