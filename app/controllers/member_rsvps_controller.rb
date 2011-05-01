class MemberRsvpsController < ApplicationController
  
  def create
    @rsvp = MemberRsvp.new(params[:member_rsvp])
    if @rsvp.save
      redirect_to root_path, :notice => "Member has been checked in"
    else
      redirect_to root_path, :notice => "Something went wrong. Member has not been checked in."
    end
  end
  
end