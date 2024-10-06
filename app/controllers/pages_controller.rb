class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:profile]

  def profile
    @user = current_user
    @posts = @user.posts.order(created_at: :desc).page(params[:page]).per(10)
  end
end
