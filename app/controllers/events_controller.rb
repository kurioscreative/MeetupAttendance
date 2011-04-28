class EventsController < ApplicationController
  
  def index
    @group = Group.find(params[:group_id])
    @meetup_events = RMeetup::Client.fetch(:events,    
        { :group_id => @group.meetup_id, 
          :after => "-1d"
        })
  end
  
end