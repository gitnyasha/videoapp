module VideosHelper
  def video_author(video)
    user_signed_in? && current_user.id == video.user_id
  end
end
