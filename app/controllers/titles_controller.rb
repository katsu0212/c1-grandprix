class TitlesController < ApplicationController
  def index
    @titles = Title.all
  end

  def new
    @title = Title.new
  end

  def create
  end

  def destroy
  end

  def title_params
    params.require(:title).permit(:title, :content, :theme_id)
  end
end
