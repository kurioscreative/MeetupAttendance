# == Schema Information
# Schema version: 20110430054416
#
# Table name: members
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  link       :string(255)
#  meetup_id  :integer
#  city       :string(255)
#  state      :string(255)
#  comment    :string(255)
#  photo_url  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Member < ActiveRecord::Base
  has_many :member_rsvps
  before_create :fetch_from_meetup

  
private
  def fetch_from_meetup
    member = RMeetup::Client.fetch(:members, {
      :member_id => meetup_id
    })
    @member ||= member.first
    fetch_name
    fetch_link
    fetch_city
    fetch_state
    fetch_photo_url
  end

  def fetch_name
    self.name = @member.name
  end
  
  def fetch_link
    self.link = @member.link
  end
  
  def fetch_city
    self.city = @member.city
  end
  
  def fetch_state
    self.state = @member.state
  end
  
  def fetch_photo_url
    self.photo_url = @member.photo_url
  end
end
