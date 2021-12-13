class RanksController < ApplicationController
  def index
    
    @week_post_like_ranks = Post.find(Like.group(:post_id).where(created_at: Time.current.all_week).order('count(post_id) desc').pluck(:post_id))
  end
end
