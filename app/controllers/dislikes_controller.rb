class DislikesController < ApplicationController
  before_action :post_params
  def create
   Dislike.create(user_id: current_user.id, post_id: params[:id])
  end
  
  def destroy
    Dislike.find_by(user_id: current_user.id, post_id: params[:id]).destroy
  end
  
  private
  
  def post_params
    @post = Post.find(params[:id])
  end
end
