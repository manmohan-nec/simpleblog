class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end
  
  def destroy
  	@tag = Tag.find(params[:id])
  	@tag.destroy

  	flash.notice = "You have now deleted Tag: -> '#{@tag.name}'!"

  	redirect_to articles_path(@articles)
  end

end