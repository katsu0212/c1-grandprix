class RanksController < ApplicationController
  before_action :authenticate_user!
  
  def index 
    @month_post_like_ranks = Post.find(Like.group(:post_id).where(created_at: Time.current.all_month).order('count(post_id) desc').pluck(:post_id))

    @month_post_dislike_ranks = Post.find(Dislike.group(:post_id).where(created_at: Time.current.all_month).order('count(post_id) desc').pluck(:post_id))
  end
end
