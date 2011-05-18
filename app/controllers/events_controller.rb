class EventsController < ApplicationController
  
  def index
    @group = Group.find(params[:group_id])
    fetched_events ||= RMeetup::Client.fetch(:events,    
        { :group_id => @group.meetup_id, 
          :after => "-1d"
        })
    @events ||= @group.events.all   
    tracked_ids = @events.collect { |x| x.meetup_id }

    @meetup_events = fetched_events.select { |x| x unless tracked_ids.include?(x.id) }
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
    @member_ids = MemberRsvp.all.collect{|x|x.meetup_id.to_i}
    @rsvps = RMeetup::Client.fetch(:rsvps, {:event_id => @event.meetup_id}).keep_if { |x| x.id.to_i == @member_ids }
    @members = MemberRsvp.scoped_by_event_id(@event.id).all
    
    # Get a list of all RMeetup:RSVPS from meetup and remove RMeetup:Rsvps whose id matches an existing MemberRsvp's id
  end
end