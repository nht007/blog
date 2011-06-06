class ApplicationController < ActionController::Base
  protect_from_forgery

  private
 
  def authenticate
    authenticate_or_request_with_http_basic do |user_name, password|
      user_name == 'tien' && password == 'Kiseki11'
    end
  end

  def tag_cloud
    @tags = Post.tag_counts_on(:tags)
  end
end
