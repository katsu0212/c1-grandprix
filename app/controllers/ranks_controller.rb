class RanksController < ApplicationController
  before_action :authenticate_user!
  
  def index 
    @month_post_like_ranks = Post.find(Like.group(:post_id).where(created_at: Time.current.all_month).order('count(post_id) desc').limit(4).pluck(:post_id))

    @month_title_smile_ranks = Title.find(Smile.group(:title_id).where(created_at: Time.current.all_month).order('count(title_id) desc').limit(4).pluck(:title_id))
  end
end
