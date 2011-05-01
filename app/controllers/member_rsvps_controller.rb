class MemberRsvpsController < ApplicationController
  
  def create
    @rsvp = MemberRsvp.new(params[:member_rsvp])
    if @rsvp.save
      redirect_to root_path
    end
  end
  
end