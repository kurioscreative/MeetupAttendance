# == Schema Information
# Schema version: 20110427143149
#
# Table name: groups
#
#  id                    :integer         not null, primary key
#  meetup_id             :integer
#  link                  :string(255)
#  organizer_id          :integer
#  organizer_profile_url :string(255)
#  organizer_name        :string(255)
#  description           :text
#  name                  :string(255)
#  photo_url             :string(255)
#  group_urlname         :string(255)
#  created_at            :datetime
#  updated_at            :datetime
#

class Group < ActiveRecord::Base

  validate :group_urlname, :presence => true
  validate :name, :presence => true
  validate :meetup_id, :presence => true
  
  before_validation :fetch_from_meetup
  
  
private
  #TODO: Refactor this process.
  def fetch_from_meetup
    group = RMeetup::Client.fetch(:groups,    
              { :group_urlname => group_urlname})
    @meetup ||= group.first
    fetch_meetup_id
    fetch_link
    fetch_organizer_id
    fetch_organizer_profile_url
    fetch_organizer_name
    fetch_description
    fetch_name
    fetch_photo_url
  end
  
  def fetch_meetup_id
    self.meetup_id = @meetup.id
  end
  
  def fetch_link
    self.link = @meetup.link
  end
  
  def fetch_organizer_id
    self.organizer_id = @meetup.organizer_id
  end
  
  def fetch_organizer_profile_url
    self.organizer_profile_url = @meetup.organizer_profile_url
  end
  
  def fetch_organizer_name
    self.organizer_name = @meetup.organizer_name
  end
  
  def fetch_description
    self.description = @meetup.description
  end
  
  def fetch_name
    self.name = @meetup.name
  end
  
  def fetch_photo_url
    self.photo_url = @meetup.photo_url
  end
  
end
