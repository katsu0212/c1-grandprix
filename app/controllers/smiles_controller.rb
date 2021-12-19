class SmilesController < ApplicationController
  before_action :title_params
  
  def create
    Smile.create(user_id: current_user.id, title_id: params[:id])
  end
  
  def destroy
    Smile.find_by(user_id: current_user.id, title_id: params[:id]).destroy
  end
  
  private

  def title_params
    @title = Title.find(params[:id])
  end

end
