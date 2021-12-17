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

end
