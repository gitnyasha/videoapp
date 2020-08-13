class UsersController < ApplicationController
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
end
