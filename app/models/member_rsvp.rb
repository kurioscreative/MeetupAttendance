# == Schema Information
# Schema version: 20110430054416
#
# Table name: member_rsvps
#
#  id           :integer         not null, primary key
#  member_id    :integer
#  response     :string(255)
#  meetup_id    :integer
#  rsvp_updated :datetime
#  event_id     :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class MemberRsvp < ActiveRecord::Base
  belongs_to :member
  
  after_create :create_member
  
  def create_member
    begin
      find_member
    rescue
      Member.create!(:meetup_id => meetup_id)
    end
  end
  
  def find_member
    Member.find_by_meetup_id(meetup_member_id)
  end
  
end
