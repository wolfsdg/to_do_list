class ListsController < ApplicationController
  def index
    @incomplete_lists = List.where(est_list: false)
    @complete_lists = List.where(est_list: true)
  end
  
  def new
    @list = List.new
  end

  def create
   @list = List.create!(params[:list])
   respond_to do |format|
      format.html { redirect_to lists_url}
      format.js {render 'widindex'}
   end
  end

  def update
    @list = List.find(params[:id])
    @list.update_attributes!(params[:list])
    respond_to do |format|
      format.html { redirect_to lists_url}
      format.js
   end
  end

  def destroy
    @list = List.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to lists_url}
      format.js
   end
  end
end
