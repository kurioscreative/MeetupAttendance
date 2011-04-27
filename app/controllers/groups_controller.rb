class GroupsController < ApplicationController


  def new
    @group = Group.new
  end
  
  def create
    @group = Group.new(params[:group])
    respond_to do |format|
      if @group.save
        format.html { redirect_to(@group) }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def show
    @group = Group.find(params[:id])
  end
end