Factory.define :group do |i|
 i.organizer_name        "Malcolm Arnold"
 i.description           "Lorem ipsum est"
 i.name                  "Ruby Nuby"
 i.group_urlname         "ruby-nuby-info"
end

Factory.define :event do |i|
  i.name    "Event name"
  i.meetup_id "11111111"
  i.group_id  "123123123"
  i.status    "past"
  i.event_url "http://meetup.com"
  i.description "Lorem ipsum est."
  i.association :group
end

Factory.define :member do |i|
  i.name    "John Smith"
  i.link    "http://meetup.com"
  i.meetup_id "123123123"
  i.city    "Nowhere"
  i.state   "NY"
  i.photo_url "http://meetup.com"
end

Factory.define :member_rsvp do |i|
  i.association :member
  i.response    "yes"
  i.meetup_id   "123123"
  i.rsvp_update DateTime.now
  i.association :event
end
  