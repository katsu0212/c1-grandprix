class RanksController < ApplicationController
  def index 
    @month_post_like_ranks = Post.find(Like.group(:post_id).where(created_at: Time.current.all_month).order('count(post_id) desc').pluck(:post_id))
  end
end
