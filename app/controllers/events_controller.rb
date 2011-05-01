class EventsController < ApplicationController
  
  def index
    @group = Group.find(params[:group_id])
    fetched_events = RMeetup::Client.fetch(:events,    
        { :group_id => @group.meetup_id, 
          :after => "-1d"
        })
    @events ||= Event.all    
    @meetup_events = fetched_events.keep_if {|event| event.id != @events.collect(&:meetup_id)}
  end

  def create
    @group = Group.find(params[:group_id])
    @event = @group.events.new(params[:event])
    
    respond_to do |format|
      if @event.save
        format.html { redirect_to(group_event_path(@group, @event)) }
      else
        format.html { redirect_to(group_events_path(@group), :notice => "Something went wrong.") }
      end
    end
  end
  

  def show
    @event = Event.find(params[:id])
    @group = Group.find(params[:group_id])
    @rsvps = RMeetup::Client.fetch(:rsvps, {:event_id => @event.meetup_id})
  end
end