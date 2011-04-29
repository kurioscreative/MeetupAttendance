# == Schema Information
# Schema version: 20110428203442
#
# Table name: events
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  meetup_id   :integer
#  group_id    :integer
#  status      :string(255)
#  event_url   :string(255)
#  description :text
#  time        :datetime
#  created_at  :datetime
#  updated_at  :datetime
#

class Event < ActiveRecord::Base
  belongs_to :group

  validates_uniqueness_of :meetup_id
  
  before_create :fetch_from_meetup
  
  
private
  #TODO: Refactor this process.
  def fetch_from_meetup
    event = RMeetup::Client.fetch(:events,    
              { :group_id => group.meetup_id,
                :id => meetup_id })
    @meetup ||= event.first
    fetch_name
    fetch_meetup_id
    fetch_status
    fetch_event_url
    fetch_description
    fetch_time
  end
  def fetch_name
    self.name = @meetup.name
  end
  def fetch_meetup_id
    self.meetup_id = @meetup.id
  end
  
  def fetch_status
    self.status = @meetup.status
  end
  
  def fetch_event_url
    self.event_url = @meetup.event_url
  end

  def fetch_description
    self.description = @meetup.description
  end
  
  def fetch_time
    self.time = @meetup.time
  end
end
