class MembersController < ApplicationController

  def create
    @member = Member.new(params[:member])
    if @member.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  
end