class TitlesController < ApplicationController
  before_action :authenticate_user!
  def index
    @titles = Title.all
  end

  def new
    @title = Title.new
  end

  def create
    @title = Title.new(title_params)
    @title.user_id = current_user.id
    if @title.save
      redirect_to titles_path
    else 
      render :new
    end
  end

  def show 
    @title = Title.find(params[:id])
  end

  def destroy
    title = Title.find(params[:id])
    title.destroy
    render :index
  end
  
  private
  def title_params
    params.require(:title).permit(:content,:theme_id)
  end

end
