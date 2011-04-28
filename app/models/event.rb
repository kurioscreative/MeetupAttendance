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
end
